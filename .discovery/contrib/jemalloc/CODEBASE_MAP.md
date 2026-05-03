# contrib/jemalloc/ — JEMalloc Memory Allocator Codebase Map

**Path:** `contrib/jemalloc/`
**Purpose:** Scalable memory allocator

## Overview

jemalloc is a general purpose malloc implementation that emphasizes fragmentation avoidance and scalable concurrency support.

## Key Files

| File | Purpose |
|------|---------|
| `include/jemalloc/jemalloc.h` | Public header |
| `src/jemalloc.c` | Main |
| `src/arena.c` | Arena |
| `src/ctl.c` | Control |
| `src/chunk.c` | Memory chunks |
| `src/hash.c` | Hash tables |
| `src/pages.c` | Pages |
| `src/tcache.c` | Thread cache |
| `src/thread.c` | Thread |

## Key Features

- Multiple size classes
- Thread-local caches (tcache)
- Chunk reuse
- Memory quarantine
- Profiling support

## Functions

```c
void *je_malloc(size_t size);
void je_free(void *ptr);
void *je_realloc(void *ptr, size_t size);
void *je_calloc(size_t num, size_t size);
size_t je_malloc_usable_size(const void *ptr);
int je_mallctl(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
```

## See Also

- `lib/libc/stdlib/` - stdlib