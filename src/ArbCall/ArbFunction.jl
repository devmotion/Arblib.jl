struct ArbFunction{T}
    fname::String
    args::Vector{Carg}
end

function ArbFunction(str::AbstractString)
    m = match(r"(?<returntype>\w+(\s\*)?)\s+(?<arbfunction>[\w_]+)\((?<args>.*)\)", str)
    isnothing(m) &&
        throw(ArgumentError("string doesn't match arblib function signature pattern"))

    args = Carg.(strip.(split(m[:args], ",")))

    return ArbFunction{arbargtypes[m[:returntype]]}(m[:arbfunction], args)
end

returntype(af::ArbFunction{T}) where {T} = T
arbfname(af::ArbFunction) = af.fname
arguments(af::ArbFunction) = af.args

function arbsignature(af::ArbFunction)
    creturnT = arbargtypes.supported_reversed[returntype(af)]
    c_args = join(arbsignature.(arguments(af)), ", ")

    return "$creturnT $(arbfname(af))($c_args)"
end

function inplace(af::ArbFunction)
    firstarg = first(arguments(af))
    return !isconst(firstarg) &&
           (ctype(firstarg) <: Ref || ctype(firstarg) <: AbstractArray)
end

function ispredicate(af::ArbFunction)
    isconst(first(arguments(af))) || return false
    returntype(af) == Cint || return false
    jlname_starts = any(s -> startswith(string(jlfname(af)), s), ("is_",))
    jlname_contains = any(
        s -> occursin(s, string(jlfname(af))),
        ("_is_", "contains", "can_", "check_", "validate_"),
    )
    jlname_eq = any(==(jlfname(af)), (:eq, :ne, :lt, :le, :gt, :ge, :overlaps, :equal))
    return jlname_starts || jlname_contains || jlname_eq
end

const jlfname_prefixes = (
    "arf",
    "arb",
    "acb",
    "mag",
    "mat",
    "vec",
    "poly",
    "scalar",
    "fpwrap",
    "double",
    "cdouble",
)
const jlfname_suffixes = ("si", "ui", "d", "mag", "arf", "arb", "acb", "mpz", "mpfr", "str")

function jlfname(
    arbfname::AbstractString,
    prefixes = jlfname_prefixes,
    suffixes = jlfname_suffixes;
    inplace = false,
)
    strs = filter(!isempty, split(arbfname, "_"))
    k = findfirst(s -> s ∉ prefixes, strs)
    l = findfirst(s -> s ∉ suffixes, reverse(strs))
    fname = join(strs[k:end-l+1], "_")
    return inplace ? Symbol(fname, "!") : Symbol(fname)
end

jlfname(
    af::ArbFunction,
    prefixes = jlfname_prefixes,
    suffixes = jlfname_suffixes;
    inplace = inplace(af),
) = jlfname(arbfname(af), prefixes, suffixes; inplace)

function jlargs(af::ArbFunction; argument_detection::Bool = true)
    cargs = arguments(af)

    jl_arg_names_types = Tuple{Symbol,Any}[]
    kwargs = Expr[]

    prec_kwarg = false
    rnd_kwarg = false
    flags_kwarg = false
    for (i, carg) in enumerate(cargs)
        if !argument_detection
            push!(jl_arg_names_types, (name(carg), jltype(carg)))
            continue
        end

        if is_precision_argument(carg)
            @assert !prec_kwarg
            prec_kwarg = true

            push!(kwargs, extract_precision_argument(carg, first(cargs)))
        elseif is_flag_argument(carg)
            @assert !flags_kwarg
            flags_kwarg = true

            push!(kwargs, extract_flag_argument(carg))
        elseif is_rounding_argument(carg)
            @assert !rnd_kwarg
            rnd_kwarg = true

            push!(kwargs, extract_rounding_argument(carg))
        elseif i > 1 && is_length_argument(carg, cargs[i-1])
            push!(kwargs, extract_length_argument(carg, cargs[i-1]))
        else
            push!(jl_arg_names_types, (name(carg), jltype(carg)))
        end
    end

    args = [:($a::$T) for (a, T) in jl_arg_names_types]

    return args, kwargs
end

function jlcode(af::ArbFunction, jl_fname = jlfname(af))
    jl_args, jl_kwargs = jlargs(af, argument_detection = true)
    jl_full_args, _ = jlargs(af, argument_detection = false)

    returnT = returntype(af)
    cargs = arguments(af)

    func_full_args = :(
        function $jl_fname($(jl_full_args...))
            __ret = ccall(
                Arblib.@libarb($(arbfname(af))),
                $returnT,
                $(Expr(:tuple, ctype.(cargs)...)),
                $(name.(cargs)...),
            )
            $(
                if returnT === Nothing && inplace(af)
                    name(first(arguments(af)))
                elseif ispredicate(af)
                    :(!iszero(__ret))
                else
                    :__ret
                end
            )
        end
    )

    if isempty(jl_kwargs)
        return func_full_args
    else
        return quote
            $func_full_args
            $jl_fname($(jl_args...); $(jl_kwargs...)) = $jl_fname($(name.(cargs)...))
        end
    end
end

macro arbcall_str(str)
    af = ArbFunction(str)
    return esc(jlcode(af))
end