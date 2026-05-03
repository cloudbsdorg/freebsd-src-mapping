# lib/libmagic/ — File Type Library Codebase Map

**Path:** `lib/libmagic/`
**Purpose:** File type detection

## Overview

libmagic provides the file type detection library.

## Key Files

| File | Purpose |
|------|---------|
| `libmagic.h` | Header |
| `softmagic.c` | Soft magic |
| `apprentice.c` | Apprentice |
| `readcdf.c` | CDF |
| `ascmagic.c` | ASCII |

## Key Functions

```c
int magic_open(int flags);
void magic_close(magic_t);
int magic_load(magic_t, const char *);
int magic_file(magic_t, const char *);
const char *magic_buffer(magic_t, const void *, size_t);
const char *magic_error(magic_t);
int magic_setflags(magic_t, int);
```

## See Also

- `contrib/file/` - Source