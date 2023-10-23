###
### **arb.h** -- real numbers
###

### Types, macros and constants

### Memory management
arbcall"void arb_init(arb_t x)"
arbcall"void arb_clear(arb_t x)"
#mo arbcall"arb_ptr _arb_vec_init(slong n)" # clashes with similar method for acb
arbcall"void _arb_vec_clear(arb_ptr v, slong n)"
arbcall"void arb_swap(arb_t x, arb_t y)"
arbcall"slong arb_allocated_bytes(const arb_t x)"
arbcall"slong _arb_vec_allocated_bytes(arb_srcptr vec, slong len)"
#mo arbcall"double _arb_vec_estimate_allocated_bytes(slong len, slong prec)" # clashes with similar method for acb

### Assignment and rounding
arbcall"void arb_set(arb_t y, const arb_t x)"
arbcall"void arb_set_arf(arb_t y, const arf_t x)"
arbcall"void arb_set_si(arb_t y, slong x)"
arbcall"void arb_set_ui(arb_t y, ulong x)"
arbcall"void arb_set_d(arb_t y, double x)"
#ni arbcall"void arb_set_fmpz(arb_t y, const fmpz_t x)"
#ni arbcall"void arb_set_fmpz_2exp(arb_t y, const fmpz_t x, const fmpz_t e)"
arbcall"void arb_set_round(arb_t y, const arb_t x, slong prec)"
#ni arbcall"void arb_set_round_fmpz(arb_t y, const fmpz_t x, slong prec)"
#ni arbcall"void arb_set_round_fmpz_2exp(arb_t y, const fmpz_t x, const fmpz_t e, slong prec)"
#ni arbcall"void arb_set_fmpq(arb_t y, const fmpq_t x, slong prec)"
arbcall"int arb_set_str(arb_t res, const char * inp, slong prec)"
arbcall"char * arb_get_str(const arb_t x, slong n, ulong flags)"

### Assignment of special values
arbcall"void arb_zero(arb_t x)"
arbcall"void arb_one(arb_t f)"
arbcall"void arb_pos_inf(arb_t x)"
arbcall"void arb_neg_inf(arb_t x)"
arbcall"void arb_zero_pm_inf(arb_t x)"
arbcall"void arb_indeterminate(arb_t x)"
arbcall"void arb_zero_pm_one(arb_t x)"
arbcall"void arb_unit_interval(arb_t x)"

### Input and output
#mo arbcall"void arb_print(const arb_t x)" # clashes with Base.print
#ns arbcall"void arb_fprint(FILE * file, const arb_t x)"
arbcall"void arb_printd(const arb_t x, slong digits)"
#ns arbcall"void arb_fprintd(FILE * file, const arb_t x, slong digits)"
arbcall"void arb_printn(const arb_t x, slong digits, ulong flags)"
#ns arbcall"void arb_fprintn(FILE * file, const arb_t x, slong digits, ulong flags)"
arbcall"char * arb_dump_str(const arb_t x)"
arbcall"int arb_load_str(arb_t x, const char * str)"
#ns arbcall"int arb_dump_file(FILE * stream, const arb_t x)"
#ns arbcall"int arb_load_file(arb_t x, FILE * stream)"

### Random number generation
#ns arbcall"void arb_randtest(arb_t x, flint_rand_t state, slong prec, slong mag_bits)"
#ns arbcall"void arb_randtest_exact(arb_t x, flint_rand_t state, slong prec, slong mag_bits)"
#ns arbcall"void arb_randtest_precise(arb_t x, flint_rand_t state, slong prec, slong mag_bits)"
#ns arbcall"void arb_randtest_wide(arb_t x, flint_rand_t state, slong prec, slong mag_bits)"
#ns arbcall"void arb_randtest_special(arb_t x, flint_rand_t state, slong prec, slong mag_bits)"
#ni arbcall"void arb_get_rand_fmpq(fmpq_t q, flint_rand_t state, const arb_t x, slong bits)"
#ns arbcall"void arb_urandom(arb_t x, flint_rand_t state, slong prec)"

### Radius and interval operations
arbcall"void arb_get_mid_arb(arb_t m, const arb_t x)"
arbcall"void arb_get_rad_arb(arb_t r, const arb_t x)"
arbcall"void arb_add_error_arf(arb_t x, const arf_t err)"
arbcall"void arb_add_error_mag(arb_t x, const mag_t err)"
arbcall"void arb_add_error(arb_t x, const arb_t err)"
arbcall"void arb_add_error_2exp_si(arb_t x, slong e)"
#ni arbcall"void arb_add_error_2exp_fmpz(arb_t x, const fmpz_t e)"
arbcall"void arb_union(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"int arb_intersection(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_nonnegative_part(arb_t res, const arb_t x)"
arbcall"void arb_get_abs_ubound_arf(arf_t u, const arb_t x, slong prec)"
arbcall"void arb_get_abs_lbound_arf(arf_t u, const arb_t x, slong prec)"
arbcall"void arb_get_ubound_arf(arf_t u, const arb_t x, slong prec)"
arbcall"void arb_get_lbound_arf(arf_t u, const arb_t x, slong prec)"
arbcall"void arb_get_mag(mag_t z, const arb_t x)"
arbcall"void arb_get_mag_lower(mag_t z, const arb_t x)"
arbcall"void arb_get_mag_lower_nonnegative(mag_t z, const arb_t x)"
#ni arbcall"void arb_get_interval_fmpz_2exp(fmpz_t a, fmpz_t b, fmpz_t exp, const arb_t x)"
arbcall"void arb_set_interval_mag(arb_t x, const mag_t a, const mag_t b, slong prec)"
arbcall"void arb_set_interval_arf(arb_t x, const arf_t a, const arf_t b, slong prec)"
arbcall"void arb_set_interval_mpfr(arb_t x, const mpfr_t a, const mpfr_t b, slong prec)"
arbcall"void arb_set_interval_neg_pos_mag(arb_t x, const mag_t a, const mag_t b, slong prec)"
arbcall"void arb_get_interval_arf(arf_t a, arf_t b, const arb_t x, slong prec)"
arbcall"void arb_get_interval_mpfr(mpfr_t a, mpfr_t b, const arb_t x)"
arbcall"slong arb_rel_error_bits(const arb_t x)"
arbcall"slong arb_rel_accuracy_bits(const arb_t x)"
arbcall"slong arb_rel_one_accuracy_bits(const arb_t x)"
arbcall"slong arb_bits(const arb_t x)"
arbcall"void arb_trim(arb_t y, const arb_t x)"
#ni arbcall"int arb_get_unique_fmpz(fmpz_t z, const arb_t x)"
arbcall"void arb_floor(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_ceil(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_trunc(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_nint(arb_t y, const arb_t x, slong prec)"
#ni arbcall"void arb_get_fmpz_mid_rad_10exp(fmpz_t mid, fmpz_t rad, fmpz_t exp, const arb_t x, slong n)"
#mo arbcall"int arb_can_round_arf(const arb_t x, slong prec, arf_rnd_t rnd)" # clashes with arb_can_round_mpfr
#mo arbcall"int arb_can_round_mpfr(const arb_t x, slong prec, mpfr_rnd_t rnd)" # clashes with arb_can_round_arf

### Comparisons
arbcall"int arb_is_zero(const arb_t x)"
arbcall"int arb_is_nonzero(const arb_t x)"
arbcall"int arb_is_one(const arb_t f)"
arbcall"int arb_is_finite(const arb_t x)"
arbcall"int arb_is_exact(const arb_t x)"
arbcall"int arb_is_int(const arb_t x)"
arbcall"int arb_is_int_2exp_si(const arb_t x, slong e)"
arbcall"int arb_equal(const arb_t x, const arb_t y)"
arbcall"int arb_equal_si(const arb_t x, slong y)"
arbcall"int arb_is_positive(const arb_t x)"
arbcall"int arb_is_nonnegative(const arb_t x)"
arbcall"int arb_is_negative(const arb_t x)"
arbcall"int arb_is_nonpositive(const arb_t x)"
arbcall"int arb_overlaps(const arb_t x, const arb_t y)"
arbcall"int arb_contains_arf(const arb_t x, const arf_t y)"
#ni arbcall"int arb_contains_fmpq(const arb_t x, const fmpq_t y)"
#ni arbcall"int arb_contains_fmpz(const arb_t x, const fmpz_t y)"
arbcall"int arb_contains_si(const arb_t x, slong y)"
arbcall"int arb_contains_mpfr(const arb_t x, const mpfr_t y)"
arbcall"int arb_contains(const arb_t x, const arb_t y)"
arbcall"int arb_contains_int(const arb_t x)"
arbcall"int arb_contains_zero(const arb_t x)"
arbcall"int arb_contains_negative(const arb_t x)"
arbcall"int arb_contains_nonpositive(const arb_t x)"
arbcall"int arb_contains_positive(const arb_t x)"
arbcall"int arb_contains_nonnegative(const arb_t x)"
arbcall"int arb_contains_interior(const arb_t x, const arb_t y)"
arbcall"int arb_eq(const arb_t x, const arb_t y)"
arbcall"int arb_ne(const arb_t x, const arb_t y)"
arbcall"int arb_lt(const arb_t x, const arb_t y)"
arbcall"int arb_le(const arb_t x, const arb_t y)"
arbcall"int arb_gt(const arb_t x, const arb_t y)"
arbcall"int arb_ge(const arb_t x, const arb_t y)"

### Arithmetic
arbcall"void arb_neg(arb_t y, const arb_t x)"
arbcall"void arb_neg_round(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_abs(arb_t y, const arb_t x)"
arbcall"void arb_nonnegative_abs(arb_t y, const arb_t x)"
arbcall"void arb_sgn(arb_t y, const arb_t x)"
arbcall"int arb_sgn_nonzero(const arb_t x)"
arbcall"void arb_min(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_max(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_minmax(arb_t z1, arb_t z2, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_add(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_add_arf(arb_t z, const arb_t x, const arf_t y, slong prec)"
arbcall"void arb_add_ui(arb_t z, const arb_t x, ulong y, slong prec)"
arbcall"void arb_add_si(arb_t z, const arb_t x, slong y, slong prec)"
#ni arbcall"void arb_add_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)"
#ni arbcall"void arb_add_fmpz_2exp(arb_t z, const arb_t x, const fmpz_t m, const fmpz_t e, slong prec)"
arbcall"void arb_sub(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_sub_arf(arb_t z, const arb_t x, const arf_t y, slong prec)"
arbcall"void arb_sub_ui(arb_t z, const arb_t x, ulong y, slong prec)"
arbcall"void arb_sub_si(arb_t z, const arb_t x, slong y, slong prec)"
#ni arbcall"void arb_sub_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)"
arbcall"void arb_mul(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_mul_arf(arb_t z, const arb_t x, const arf_t y, slong prec)"
arbcall"void arb_mul_si(arb_t z, const arb_t x, slong y, slong prec)"
arbcall"void arb_mul_ui(arb_t z, const arb_t x, ulong y, slong prec)"
#ni arbcall"void arb_mul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)"
arbcall"void arb_mul_2exp_si(arb_t y, const arb_t x, slong e)"
#ni arbcall"void arb_mul_2exp_fmpz(arb_t y, const arb_t x, const fmpz_t e)"
arbcall"void arb_addmul(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_addmul_arf(arb_t z, const arb_t x, const arf_t y, slong prec)"
arbcall"void arb_addmul_si(arb_t z, const arb_t x, slong y, slong prec)"
arbcall"void arb_addmul_ui(arb_t z, const arb_t x, ulong y, slong prec)"
#ni arbcall"void arb_addmul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)"
arbcall"void arb_submul(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_submul_arf(arb_t z, const arb_t x, const arf_t y, slong prec)"
arbcall"void arb_submul_si(arb_t z, const arb_t x, slong y, slong prec)"
arbcall"void arb_submul_ui(arb_t z, const arb_t x, ulong y, slong prec)"
#ni arbcall"void arb_submul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)"
arbcall"void arb_fma(arb_t res, const arb_t x, const arb_t y, const arb_t z, slong prec)"
arbcall"void arb_fma_arf(arb_t res, const arb_t x, const arf_t y, const arb_t z, slong prec)"
arbcall"void arb_fma_si(arb_t res, const arb_t x, slong y, const arb_t z, slong prec)"
arbcall"void arb_fma_ui(arb_t res, const arb_t x, ulong y, const arb_t z, slong prec)"
#ni arbcall"void arb_fma_fmpz(arb_t res, const arb_t x, const fmpz_t y, const arb_t z, slong prec)"
arbcall"void arb_inv(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_div(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_div_arf(arb_t z, const arb_t x, const arf_t y, slong prec)"
arbcall"void arb_div_si(arb_t z, const arb_t x, slong y, slong prec)"
arbcall"void arb_div_ui(arb_t z, const arb_t x, ulong y, slong prec)"
#ni arbcall"void arb_div_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)"
#ni arbcall"void arb_fmpz_div_fmpz(arb_t z, const fmpz_t x, const fmpz_t y, slong prec)"
arbcall"void arb_ui_div(arb_t z, ulong x, const arb_t y, slong prec)"
arbcall"void arb_div_2expm1_ui(arb_t z, const arb_t x, ulong n, slong prec)"

### Dot product
arbcall"void arb_dot_precise(arb_t res, const arb_t s, int subtract, arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void arb_dot_simple(arb_t res, const arb_t s, int subtract, arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void arb_dot(arb_t res, const arb_t s, int subtract, arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void arb_approx_dot(arb_t res, const arb_t s, int subtract, arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void arb_dot_ui(arb_t res, const arb_t initial, int subtract, arb_srcptr x, slong xstep, const ulong * y, slong ystep, slong len, slong prec)"
arbcall"void arb_dot_si(arb_t res, const arb_t initial, int subtract, arb_srcptr x, slong xstep, const slong * y, slong ystep, slong len, slong prec)"
arbcall"void arb_dot_uiui(arb_t res, const arb_t initial, int subtract, arb_srcptr x, slong xstep, const ulong * y, slong ystep, slong len, slong prec)"
arbcall"void arb_dot_siui(arb_t res, const arb_t initial, int subtract, arb_srcptr x, slong xstep, const ulong * y, slong ystep, slong len, slong prec)"
#ni arbcall"void arb_dot_fmpz(arb_t res, const arb_t initial, int subtract, arb_srcptr x, slong xstep, const fmpz * y, slong ystep, slong len, slong prec)"

### Powers and roots
arbcall"void arb_sqrt(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_sqrt_arf(arb_t z, const arf_t x, slong prec)"
#ni arbcall"void arb_sqrt_fmpz(arb_t z, const fmpz_t x, slong prec)"
arbcall"void arb_sqrt_ui(arb_t z, ulong x, slong prec)"
arbcall"void arb_sqrtpos(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_hypot(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_rsqrt(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_rsqrt_ui(arb_t z, ulong x, slong prec)"
arbcall"void arb_sqrt1pm1(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_root_ui(arb_t z, const arb_t x, ulong k, slong prec)"
#mo arbcall"void arb_root(arb_t z, const arb_t x, ulong k, slong prec)" # alias to arb_root_ui
arbcall"void arb_sqr(arb_t y, const arb_t x, slong prec)"
#ni arbcall"void arb_pow_fmpz_binexp(arb_t y, const arb_t b, const fmpz_t e, slong prec)"
#ni arbcall"void arb_pow_fmpz(arb_t y, const arb_t b, const fmpz_t e, slong prec)"
arbcall"void arb_pow_ui(arb_t y, const arb_t b, ulong e, slong prec)"
arbcall"void arb_ui_pow_ui(arb_t y, ulong b, ulong e, slong prec)"
arbcall"void arb_si_pow_ui(arb_t y, slong b, ulong e, slong prec)"
#ni arbcall"void arb_pow_fmpq(arb_t y, const arb_t x, const fmpq_t a, slong prec)"
arbcall"void arb_pow(arb_t z, const arb_t x, const arb_t y, slong prec)"

### Exponentials and logarithms
arbcall"void arb_log_ui(arb_t z, ulong x, slong prec)"
#ni arbcall"void arb_log_fmpz(arb_t z, const fmpz_t x, slong prec)"
arbcall"void arb_log_arf(arb_t z, const arf_t x, slong prec)"
arbcall"void arb_log(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_log_ui_from_prev(arb_t log_k1, ulong k1, arb_t log_k0, ulong k0, slong prec)"
arbcall"void arb_log1p(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_log_base_ui(arb_t res, const arb_t x, ulong b, slong prec)"
arbcall"void arb_log_hypot(arb_t res, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_exp(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_expm1(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_exp_invexp(arb_t z, arb_t w, const arb_t x, slong prec)"

### Trigonometric functions
arbcall"void arb_sin(arb_t s, const arb_t x, slong prec)"
arbcall"void arb_cos(arb_t c, const arb_t x, slong prec)"
arbcall"void arb_sin_cos(arb_t s, arb_t c, const arb_t x, slong prec)"
arbcall"void arb_sin_pi(arb_t s, const arb_t x, slong prec)"
arbcall"void arb_cos_pi(arb_t c, const arb_t x, slong prec)"
arbcall"void arb_sin_cos_pi(arb_t s, arb_t c, const arb_t x, slong prec)"
arbcall"void arb_tan(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_cot(arb_t y, const arb_t x, slong prec)"
#ni arbcall"void arb_sin_cos_pi_fmpq(arb_t s, arb_t c, const fmpq_t x, slong prec)"
#ni arbcall"void arb_sin_pi_fmpq(arb_t s, const fmpq_t x, slong prec)"
#ni arbcall"void arb_cos_pi_fmpq(arb_t c, const fmpq_t x, slong prec)"
arbcall"void arb_tan_pi(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_cot_pi(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_sec(arb_t res, const arb_t x, slong prec)"
arbcall"void arb_csc(arb_t res, const arb_t x, slong prec)"
arbcall"void arb_csc_pi(arb_t res, const arb_t x, slong prec)"
arbcall"void arb_sinc(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_sinc_pi(arb_t z, const arb_t x, slong prec)"

### Inverse trigonometric functions
arbcall"void arb_atan_arf(arb_t z, const arf_t x, slong prec)"
arbcall"void arb_atan(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_atan2(arb_t z, const arb_t b, const arb_t a, slong prec)"
arbcall"void arb_asin(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_acos(arb_t z, const arb_t x, slong prec)"

### Hyperbolic functions
arbcall"void arb_sinh(arb_t s, const arb_t x, slong prec)"
arbcall"void arb_cosh(arb_t c, const arb_t x, slong prec)"
arbcall"void arb_sinh_cosh(arb_t s, arb_t c, const arb_t x, slong prec)"
arbcall"void arb_tanh(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_coth(arb_t y, const arb_t x, slong prec)"
arbcall"void arb_sech(arb_t res, const arb_t x, slong prec)"
arbcall"void arb_csch(arb_t res, const arb_t x, slong prec)"

### Inverse hyperbolic functions
arbcall"void arb_atanh(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_asinh(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_acosh(arb_t z, const arb_t x, slong prec)"

### Constants
arbcall"void arb_const_pi(arb_t z, slong prec)"
arbcall"void arb_const_sqrt_pi(arb_t z, slong prec)"
arbcall"void arb_const_log_sqrt2pi(arb_t z, slong prec)"
arbcall"void arb_const_log2(arb_t z, slong prec)"
arbcall"void arb_const_log10(arb_t z, slong prec)"
arbcall"void arb_const_euler(arb_t z, slong prec)"
arbcall"void arb_const_catalan(arb_t z, slong prec)"
arbcall"void arb_const_e(arb_t z, slong prec)"
arbcall"void arb_const_khinchin(arb_t z, slong prec)"
arbcall"void arb_const_glaisher(arb_t z, slong prec)"
arbcall"void arb_const_apery(arb_t z, slong prec)"

### Lambert W function
arbcall"void arb_lambertw(arb_t res, const arb_t x, int flags, slong prec)"

### Gamma function and factorials
arbcall"void arb_rising_ui(arb_t z, const arb_t x, ulong n, slong prec)"
arbcall"void arb_rising(arb_t z, const arb_t x, const arb_t n, slong prec)"
#ni arbcall"void arb_rising_fmpq_ui(arb_t z, const fmpq_t x, ulong n, slong prec)"
arbcall"void arb_fac_ui(arb_t z, ulong n, slong prec)"
arbcall"void arb_doublefac_ui(arb_t z, ulong n, slong prec)"
arbcall"void arb_bin_ui(arb_t z, const arb_t n, ulong k, slong prec)"
arbcall"void arb_bin_uiui(arb_t z, ulong n, ulong k, slong prec)"
arbcall"void arb_gamma(arb_t z, const arb_t x, slong prec)"
#ni arbcall"void arb_gamma_fmpq(arb_t z, const fmpq_t x, slong prec)"
#ni arbcall"void arb_gamma_fmpz(arb_t z, const fmpz_t x, slong prec)"
arbcall"void arb_lgamma(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_rgamma(arb_t z, const arb_t x, slong prec)"
arbcall"void arb_digamma(arb_t y, const arb_t x, slong prec)"

### Zeta function
arbcall"void arb_zeta_ui_vec_borwein(arb_ptr z, ulong start, slong num, ulong step, slong prec)"
arbcall"void arb_zeta_ui_asymp(arb_t x, ulong s, slong prec)"
arbcall"void arb_zeta_ui_euler_product(arb_t z, ulong s, slong prec)"
arbcall"void arb_zeta_ui_bernoulli(arb_t x, ulong s, slong prec)"
arbcall"void arb_zeta_ui_borwein_bsplit(arb_t x, ulong s, slong prec)"
arbcall"void arb_zeta_ui_vec(arb_ptr x, ulong start, slong num, slong prec)"
arbcall"void arb_zeta_ui_vec_even(arb_ptr x, ulong start, slong num, slong prec)"
arbcall"void arb_zeta_ui_vec_odd(arb_ptr x, ulong start, slong num, slong prec)"
arbcall"void arb_zeta_ui(arb_t x, ulong s, slong prec)"
arbcall"void arb_zeta(arb_t z, const arb_t s, slong prec)"
arbcall"void arb_hurwitz_zeta(arb_t z, const arb_t s, const arb_t a, slong prec)"

### Bernoulli numbers and polynomials
arbcall"void arb_bernoulli_ui(arb_t b, ulong n, slong prec)"
#ni arbcall"void arb_bernoulli_fmpz(arb_t b, const fmpz_t n, slong prec)"
arbcall"void arb_bernoulli_ui_zeta(arb_t b, ulong n, slong prec)"
arbcall"void arb_bernoulli_poly_ui(arb_t res, ulong n, const arb_t x, slong prec)"
arbcall"void arb_power_sum_vec(arb_ptr res, const arb_t a, const arb_t b, slong len, slong prec)"

### Polylogarithms
arbcall"void arb_polylog(arb_t w, const arb_t s, const arb_t z, slong prec)"
arbcall"void arb_polylog_si(arb_t w, slong s, const arb_t z, slong prec)"

### Other special functions
#ni arbcall"void arb_fib_fmpz(arb_t z, const fmpz_t n, slong prec)"
arbcall"void arb_fib_ui(arb_t z, ulong n, slong prec)"
arbcall"void arb_agm(arb_t z, const arb_t x, const arb_t y, slong prec)"
arbcall"void arb_chebyshev_t_ui(arb_t a, ulong n, const arb_t x, slong prec)"
arbcall"void arb_chebyshev_u_ui(arb_t a, ulong n, const arb_t x, slong prec)"
arbcall"void arb_chebyshev_t2_ui(arb_t a, arb_t b, ulong n, const arb_t x, slong prec)"
arbcall"void arb_chebyshev_u2_ui(arb_t a, arb_t b, ulong n, const arb_t x, slong prec)"
#ni arbcall"void arb_bell_sum_bsplit(arb_t res, const fmpz_t n, const fmpz_t a, const fmpz_t b, const fmpz_t mmag, slong prec)"
#ni arbcall"void arb_bell_sum_taylor(arb_t res, const fmpz_t n, const fmpz_t a, const fmpz_t b, const fmpz_t mmag, slong prec)"
#ni arbcall"void arb_bell_fmpz(arb_t res, const fmpz_t n, slong prec)"
arbcall"void arb_bell_ui(arb_t res, ulong n, slong prec)"
#ni arbcall"void arb_euler_number_fmpz(arb_t res, const fmpz_t n, slong prec)"
arbcall"void arb_euler_number_ui(arb_t res, ulong n, slong prec)"
#ni arbcall"void arb_fmpz_euler_number_ui_multi_mod(fmpz_t res, ulong n, double alpha)"
#ni arbcall"void arb_fmpz_euler_number_ui(fmpz_t res, ulong n)"
#ni arbcall"void arb_partitions_fmpz(arb_t res, const fmpz_t n, slong prec)"
arbcall"void arb_partitions_ui(arb_t res, ulong n, slong prec)"
arbcall"void arb_primorial_nth_ui(arb_t res, ulong n, slong prec)"
arbcall"void arb_primorial_ui(arb_t res, ulong n, slong prec)"

### Internals for computing elementary functions
#ni arbcall"void _arb_atan_taylor_naive(mp_ptr y, mp_limb_t * error, mp_srcptr x, mp_size_t xn, ulong N, int alternating)"
#ni arbcall"void _arb_atan_taylor_rs(mp_ptr y, mp_limb_t * error, mp_srcptr x, mp_size_t xn, ulong N, int alternating)"
#ni arbcall"void _arb_exp_taylor_naive(mp_ptr y, mp_limb_t * error, mp_srcptr x, mp_size_t xn, ulong N)"
#ni arbcall"void _arb_exp_taylor_rs(mp_ptr y, mp_limb_t * error, mp_srcptr x, mp_size_t xn, ulong N)"
#ni arbcall"void _arb_sin_cos_taylor_naive(mp_ptr ysin, mp_ptr ycos, mp_limb_t * error, mp_srcptr x, mp_size_t xn, ulong N)"
#ni arbcall"void _arb_sin_cos_taylor_rs(mp_ptr ysin, mp_ptr ycos, mp_limb_t * error, mp_srcptr x, mp_size_t xn, ulong N, int sinonly, int alternating)"
#ni arbcall"int _arb_get_mpn_fixed_mod_log2(mp_ptr w, fmpz_t q, mp_limb_t * error, const arf_t x, mp_size_t wn)"
#ni arbcall"int _arb_get_mpn_fixed_mod_pi4(mp_ptr w, fmpz_t q, int * octant, mp_limb_t * error, const arf_t x, mp_size_t wn)"
arbcall"slong _arb_exp_taylor_bound(slong mag, slong prec)"
arbcall"void arb_exp_arf_bb(arb_t z, const arf_t x, slong prec, int m1)"
#ni arbcall"void _arb_exp_sum_bs_simple(fmpz_t T, fmpz_t Q, flint_bitcnt_t * Qexp, const fmpz_t x, flint_bitcnt_t r, slong N)"
#ni arbcall"void _arb_exp_sum_bs_powtab(fmpz_t T, fmpz_t Q, flint_bitcnt_t * Qexp, const fmpz_t x, flint_bitcnt_t r, slong N)"
arbcall"void arb_exp_arf_rs_generic(arb_t res, const arf_t x, slong prec, int minus_one)"
#ni arbcall"void _arb_atan_sum_bs_simple(fmpz_t T, fmpz_t Q, flint_bitcnt_t * Qexp, const fmpz_t x, flint_bitcnt_t r, slong N)"
#ni arbcall"void _arb_atan_sum_bs_powtab(fmpz_t T, fmpz_t Q, flint_bitcnt_t * Qexp, const fmpz_t x, flint_bitcnt_t r, slong N)"
arbcall"void arb_atan_arf_bb(arb_t z, const arf_t x, slong prec)"
#ni arbcall"void arb_atan_frac_bsplit(arb_t s, const fmpz_t p, const fmpz_t q, int hyperbolic, slong prec)"
arbcall"void arb_sin_cos_arf_generic(arb_t s, arb_t c, const arf_t x, slong prec)"
arbcall"void arb_sin_cos_arf_bb(arb_t s, arb_t c, const arf_t x, slong prec)"
arbcall"void arb_sin_cos_wide(arb_t s, arb_t c, const arb_t x, slong prec)"
arbcall"void arb_sin_cos_generic(arb_t s, arb_t c, const arb_t x, slong prec)"
arbcall"void arb_log_primes_vec_bsplit(arb_ptr res, slong n, slong prec)"
arbcall"void _arb_log_p_ensure_cached(slong prec)"
arbcall"void arb_exp_arf_log_reduction(arb_t res, const arf_t x, slong prec, int minus_one)"
arbcall"void arb_exp_arf_generic(arb_t z, const arf_t x, slong prec, int minus_one)"
arbcall"void arb_exp_arf(arb_t z, const arf_t x, slong prec, int minus_one, slong maglim)"
arbcall"void arb_log_newton(arb_t res, const arb_t x, slong prec)"
arbcall"void arb_log_arf_newton(arb_t res, const arf_t x, slong prec)"
arbcall"void arb_atan_gauss_primes_vec_bsplit(arb_ptr res, slong n, slong prec)"
arbcall"void _arb_atan_gauss_p_ensure_cached(slong prec)"
arbcall"void arb_sin_cos_arf_atan_reduction(arb_t res1, arb_t res2, const arf_t x, slong prec)"
arbcall"void arb_atan_newton(arb_t res, const arb_t x, slong prec)"
arbcall"void arb_atan_arf_newton(arb_t res, const arf_t x, slong prec)"

### Vector functions
arbcall"void _arb_vec_zero(arb_ptr vec, slong n)"
arbcall"int _arb_vec_is_zero(arb_srcptr vec, slong len)"
arbcall"int _arb_vec_is_finite(arb_srcptr x, slong len)"
arbcall"void _arb_vec_set(arb_ptr res, arb_srcptr vec, slong len)"
arbcall"void _arb_vec_set_round(arb_ptr res, arb_srcptr vec, slong len, slong prec)"
arbcall"void _arb_vec_swap(arb_ptr vec1, arb_ptr vec2, slong len)"
arbcall"void _arb_vec_neg(arb_ptr B, arb_srcptr A, slong n)"
arbcall"void _arb_vec_sub(arb_ptr C, arb_srcptr A, arb_srcptr B, slong n, slong prec)"
arbcall"void _arb_vec_add(arb_ptr C, arb_srcptr A, arb_srcptr B, slong n, slong prec)"
arbcall"void _arb_vec_scalar_mul(arb_ptr res, arb_srcptr vec, slong len, const arb_t c, slong prec)"
arbcall"void _arb_vec_scalar_div(arb_ptr res, arb_srcptr vec, slong len, const arb_t c, slong prec)"
#ni arbcall"void _arb_vec_scalar_mul_fmpz(arb_ptr res, arb_srcptr vec, slong len, const fmpz_t c, slong prec)"
arbcall"void _arb_vec_scalar_mul_2exp_si(arb_ptr res, arb_srcptr src, slong len, slong c)"
arbcall"void _arb_vec_scalar_addmul(arb_ptr res, arb_srcptr vec, slong len, const arb_t c, slong prec)"
arbcall"void _arb_vec_get_mag(mag_t bound, arb_srcptr vec, slong len)"
arbcall"slong _arb_vec_bits(arb_srcptr x, slong len)"
arbcall"void _arb_vec_set_powers(arb_ptr xs, const arb_t x, slong len, slong prec)"
#ni arbcall"void _arb_vec_add_error_arf_vec(arb_ptr res, arf_srcptr err, slong len)"
#ni arbcall"void _arb_vec_add_error_mag_vec(arb_ptr res, mag_srcptr err, slong len)"
arbcall"void _arb_vec_indeterminate(arb_ptr vec, slong len)"
arbcall"void _arb_vec_trim(arb_ptr res, arb_srcptr vec, slong len)"
#ni arbcall"int _arb_vec_get_unique_fmpz_vec(fmpz * res,  arb_srcptr vec, slong len)"
