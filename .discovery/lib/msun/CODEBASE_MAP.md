# lib/msun/ — Math Library Codebase Map

**Path:** `lib/msun/`
**Purpose:** FreeBSD math library (libm)

## Overview

The msun directory contains the math library implementation. It provides IEEE 754-compliant floating-point math functions.

## Source Organization

### Architecture-Specific (src/, i387/, amd64/, aarch64/, etc.)

| Directory | Purpose |
|-----------|---------|
| `src/` | Generic implementations |
| `i387/` | x87 FPU |
| `amd64/` | AMD64 |
| `aarch64/` | ARM64 |
| `arm/` | ARM |
| `powerpc/` | PowerPC |
| `riscv/` | RISC-V |
| `x86/` | x86 generic |

## Key Functions

### Trigonometric Functions

```c
// src/s_sin.c
double sin(double x);
float sinf(float x);
long double sinl(long double x);

// src/s_cos.c
double cos(double x);
float cosf(float x);
long double cosl(long double x);

// src/s_tan.c
double tan(double x);
float tanf(float x);
long double tanl(long double x);
```

### Inverse Trigonometric

```c
double asin(double x);
double acos(double x);
double atan(double x);
double atan2(double y, double x);
```

### Hyperbolic

```c
double sinh(double x);
double cosh(double x);
double tanh(double x);
```

### Exponential & Logarithmic

```c
// src/s_exp.c
double exp(double x);
float expf(float x);

// src/s_log.c
double log(double x);
double log10(double x);
double log2(double x);
```

### Power Functions

```c
// src/s_pow.c
double pow(double x, double y);

// src/s_sqrt.c
double sqrt(double x);
float sqrtf(float x);

// src/s_cbrt.c
double cbrt(double x);
```

### Error Functions

```c
// src/s_erf.c
double erf(double x);
double erfc(double x);
```

### Gamma Functions

```c
double gamma(double x);
double lgamma(double x);
double tgamma(double x);
```

### Rounding Functions

```c
double floor(double x);
double ceil(double x);
double round(double x);
double trunc(double x);
double rint(double x);
```

### Remainder

```c
double fmod(double x, double y);
double remainder(double x, double y);
```

## IEEE 754 Support

### Inf/NaN Handling

```c
// src/s_inf.c
double inf(void);
float inff(void);

// src/s_nan.c
double nan(const char *tagp);
```

### Classification

```c
int fpclassify(double x);
int isnan(double x);
int isinf(double x);
int isfinite(double x);
int isnormal(double x);
```

## Long Double Support

| Directory | Precision |
|-----------|-----------|
| `ld80/` | 80-bit long double (x87) |
| `ld128/` | 128-bit long double (ia64) |

## Build System

```makefile
# Makefile
SRCS=  src/s_sin.c src/s_cos.c src/s_tan.c ...

.include <bsd.lib.mk>
```

## Key Headers

```c
#include <math.h>        // Main math header
#include <fenv.h>       // Floating-point environment
```

## See Also

- `lib/libc/stdlib/` - Related stdlib functions