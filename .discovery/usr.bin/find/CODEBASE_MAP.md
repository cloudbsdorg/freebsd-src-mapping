# usr.bin/find/ — Find Utility Codebase Map

**Path:** `usr.bin/find/`
**Purpose:** File searching utility

## Overview

find searches for files in directory hierarchies.

## Key Files

| File | Purpose |
|------|---------|
| `find.c` | Main |
| `find.h` | Header |

## Key Functions

```c
int find(char *path, struct options *);
int match(struct options *, char *);
```

## See Also

- `lib/libc/` - Uses libc