# contrib/libexecinfo/ — Libexecinfo Codebase Map

**Path:** `contrib/libexecinfo/`
**Purpose:** Backtrace library

## Overview

libexecinfo provides stack backtrace functions.

## Key Files

| File | Purpose |
|------|---------|
| `libexecinfo.c` | Main |

## Key Functions

```c
int backtrace(void **, int);
char **backtrace_symbols(void *const *, int);
void backtrace_symbols_fd(void *const *, int, int);
```

## See Also

- `lib/libexecinfo/` - Installed