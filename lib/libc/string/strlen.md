# strlen

## Purpose
- Compute the length of a C string (number of characters before the terminating null byte).

## Key Functions
- size_t strlen(const char *s);
  - Returns the number of characters in s, not including the NUL terminator.

## Mermaid relationship diagram
```mermaid
graph TD
  strlen.c -->|includes| <stddef.h>
  strlen.c -->|uses| <internal_loop_helpers?>
```

## Dependencies
- <stddef.h> for size_t
- Minimal reliance on other libc string utilities; typically self-contained loop over characters.

## What depends on this
- Many string handling utilities rely on length information, e.g., strcat, copy/search routines, printf-style formatting when computing buffer sizes.
