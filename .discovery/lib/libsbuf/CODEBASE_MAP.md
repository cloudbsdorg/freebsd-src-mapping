# lib/libsbuf/ — String Buffer Library Codebase Map

**Path:** `lib/libsbuf/`
**Purpose:** Dynamic string buffers

## Overview

libsbuf provides dynamic string buffers.

## Key Files

| File | Purpose |
|------|---------|
| `sbuf.c` | Main |
| `sbuf.h` | Header |

## Key Functions

```c
struct sbuf *sbuf_new(struct sbuf *, char *, int, int);
int sbuf_clear(struct sbuf *);
int sbuf_setpos(struct sbuf *, int);
int sbuf_putc(struct sbuf *, int);
int sbuf_write(struct sbuf *, const char *, int);
int sbuf_printf(struct sbuf *, const char *, ...) __printflike(2, 3);
int sbuf_cat(struct sbuf *, const char *);
int sbuf_copyin(struct sbuf *, const char *, int);
char *sbuf_data(struct sbuf *);
int sbuf_len(struct sbuf *);
int sbuf_finish(struct sbuf *);
void sbuf_delete(struct sbuf *);
```

## See Also

- `lib/libc/` - Standard C library