# strcpy

## Purpose
- Copy a NUL-terminated string from src to dst, including the terminator. Assumes dst has enough space.

## Key Functions
- char *strcpy(char *dst, const char *src);
  - Copies the string src to dst including the terminating NUL.

## Mermaid relationship diagram
```mermaid
graph TD
  strcpy.c -->|includes| <stddef.h>
  strcpy.c -->|uses| strlen? (length not strictly needed for copy, but may be used in some implementations)
```

## Dependencies
- <stddef.h> for size_t, and <string.h> for API consistency.
- May rely on internal helpers for byte-wise copying with optimizations.

## What depends on this
- Any function that builds upon string copying, e.g., strcat, strncpy, and snprintf-style routines that copy into buffers.
