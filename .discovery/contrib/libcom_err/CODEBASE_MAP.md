# contrib/libcom_err/ — Libcom_err Codebase Map

**Path:** `contrib/libcom_err/`
**Purpose:** Common error library

## Overview

libcom_err provides common error functions.

## Key Files

| File | Purpose |
|------|---------|
| `lib/com_err.c` | Main |
| `lib/com_err.h` | Header |

## Key Functions

```c
void com_err(const char *, long, const char *, ...);
const char *error_message(long);
void (*error_print_prog)(void);
```

## See Also

- `lib/libcom_err/` - Library