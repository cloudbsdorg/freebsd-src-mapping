# lib/libxo/ — Structured Output Library Codebase Map

**Path:** `lib/libxo/`
**Purpose:** Structured output for CLI tools

## Overview

libxo allows programs to format output as text, JSON, or HTML.

## Key Files

| File | Purpose |
|------|---------|
| `libxo.c` | Main |
| `libxo.h` | Header |
| `xo.c` | High-level |

## Key Functions

```c
// Initialization
void xo_open(const char *);
void xo_close(void);
void xo_set_flags(const char *, int);

// Writers
int xo_write(struct xo_buffer *);
int xo_flush(void);

// Format functions
int xo_emit(const char *, ...);
int xo_emit_h(void *, const char *, ...);

// Container functions
int xo_open_container(const char *);
int xo_close_container(const char *);
int xo_open_instance(const char *);
int xo_close_instance(const char *);

// List functions
int xo_open_list(const char *);
int xo_close_list(const char *);
int xo_open_list_item(const char *, const char *);
int xo_close_list_item(void);

// Value functions
int xo_attr(const char *, const char *, ...);
int xo_value(const char *, const char *, ...);
```

## Format Strings

```
{:#1}{:name/%s}{:value/%s}
```

## See Also

- `usr.sbin/` - Many tools use libxo