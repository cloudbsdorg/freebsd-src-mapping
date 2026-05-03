# contrib/gdtoa/ — Float-to-ASCII Conversion Codebase Map

**Path:** `contrib/gdtoa/`
**Purpose:** High-performance float conversion

## Overview

gdtoa provides high-performance conversion of floats to ASCII.

## Key Files

| File | Purpose |
|------|---------|
| `gdtoa.c` | Main |
| `strtodg.c` | String to double |
| `dmisc.c` | Misc |

## Key Functions

```c
char *gdtoa(struct FPI *, int, int, union Ieee754 *, int, int, char **);
double strtodg(const char *, char **, int, struct FPI *, int *);
```

## See Also

- `lib/libc/` - libc