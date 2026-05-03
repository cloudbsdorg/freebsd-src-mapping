# lib/libiconv/ — Character Set Conversion Codebase Map

**Path:** `lib/libiconv/`
**Purpose:** Character set conversion

## Overview

libiconv provides character set conversion.

## Key Files

| File | Purpose |
|------|---------|
| `iconv.c` | Main |
| `iconv.h` | Header |

## Key Functions

```c
size_t iconv(iconv_t, const char **, size_t *, char **, size_t *);
iconv_t iconv_open(const char *, const char *);
int iconv_close(iconv_t);
```

## See Also

- `contrib/libiconv/` - Source