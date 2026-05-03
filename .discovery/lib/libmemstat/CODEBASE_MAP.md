# lib/libmemstat/ — Memory Statistics Library Codebase Map

**Path:** `lib/libmemstat/`
**Purpose:** Kernel memory statistics

## Overview

libmemstat provides access to kernel memory statistics.

## Key Files

| File | Purpose |
|------|---------|
| `memstat.c` | Main |
| `memstat.h` | Header |
| `memstat_uma.c` | UMA stats |

## Key Functions

```c
struct memstat *memstat_get_malloc(unsigned int *count);
struct memstat *memstat_get_uma(unsigned int *count);

int memstat捅to_buf(void *, size_t, int);
struct memstat *memstat_hash_malloc(int);
```

## See Also

- `sys/vm/` - VM subsystem