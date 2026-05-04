# strcat

## Purpose
- Append the null-terminated string src to the end of dst, overwriting the terminator, and add a new terminator.

## Key Functions
- char *strcat(char *dst, const char *src);
  - Appends src to the end of dst, assuming enough space in dst.

## Mermaid relationship diagram
```mermaid
graph TD
  strcat.c -->|includes| <stddef.h>
  strcat.c -->|uses| strlen
```

## Dependencies
- <stddef.h> for size_t; depends on null-terminated semantics and strlen for length checks (if used).

## What depends on this
- strncat, strcpy-based helpers, and higher-level formatting routines that build strings.
