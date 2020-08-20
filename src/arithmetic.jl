Base.promote_rule(::Type{Arf}, ::Type{<:Union{AbstractFloat,Integer}}) = Arf
Base.promote_rule(::Type{Arb}, ::Type{<:Union{AbstractFloat,Integer,Rational,Arf,ArbRef}}) =
    Arb
Base.promote_rule(
    ::Type{Acb},
    ::Type{
        <:Union{
            AbstractFloat,
            Integer,
            Rational,
            Complex{<:Union{AbstractFloat,Integer,Rational}},
            Arf,
            Arb,
            ArbRef,
            AcbRef,
        },
    },
) = Acb

for (jf, af) in [(:+, :add!), (:-, :sub!), (:*, :mul!), (:/, :div!)]
    @eval function Base.$jf(x::T, y::T) where {T<:Union{Arf,Arb,ArbRef,Acb,AcbRef}}
        z = T(prec = max(precision(x), precision(y)))
        $af(z, x, y)
        z
    end
end
function Base.:(-)(x::T) where {T<:Union{Arf,Arb,ArbRef,Acb,AcbRef}}
    z = T(prec = precision(x))
    neg!(z, x)
    z
end
function Base.:(^)(x::T, k::Integer) where {T<:Union{Arb,ArbRef,Acb,AcbRef}}
    z = T(prec = precision(x))
    pow!(z, x, convert(UInt, k))
    z
end

for f in [
    :sqrt,
    :exp,
    :log,
    :log1p,
    :sin,
    :cos,
    :tan,
    :cot,
    :asin,
    :acos,
    :atan,
    :acot,
    :sinc,
    :sinh,
    :cosh,
    :tanh,
    :asinh,
    :acosh,
    :atanh,
    :sec,
    :asec,
    :sech,
    :asech,
]
    @eval function Base.$f(x::T) where {T<:Union{Arb,ArbRef,Acb,AcbRef}}
        z = T(prec = max(precision(x)))
        $(Symbol(f, :!))(z, x)
        z
    end
end