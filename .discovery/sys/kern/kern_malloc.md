# Component: kern_malloc.c

**Path:** `sys/kern/kern_malloc.c`
**Type:** File
**Maps to:** `.discovery/sys/kern/kern_malloc.md`

## Purpose

Kernel memory allocator (malloc(9)) - provides dynamic memory allocation for kernel code. Uses UMA (Universal Memory Allocator) as backend with fixed-size buckets for small allocations and direct UMA for larger ones.

## Structure

```mermaid
flowchart TD
    A[malloc - allocate] --> B[uma_alloc - UMA backend]
    C[free - deallocate] --> D[uma_free - UMA backend]
    B --> E[kmem_zone - per-type zone]
    D --> E
    E --> F[vmem(9) - virtual memory]
    F --> G[vm_page - physical pages]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `malloc` | Allocate kernel memory | `void *malloc(size_t size, struct malloc_type *type, int flags)` |
| `free` | Free kernel memory | `void free(void *addr, struct malloc_type *type)` |
| `mallocarray` | Allocate array | `void *mallocarray(size_t nmemb, size_t size, ...)` |
| `realloc` | Reallocate memory | `void *realloc(void *addr, size_t size, ...)` |
| `malloc_malloc` | MALLOC_DEFINE type initializer | `struct malloc_type *malloc_malloc(...)` |

## malloc Type System

| Element | Purpose |
|---------|---------|
| `MALLOC_DECLARE` | Compile-time type registration |
| `MALLOC_DEFINE` | Static type definition |
| `struct malloc_type` | Tracks per-type statistics |

## Flags

| Flag | Meaning |
|------|---------|
| `M_WAITOK` | Can sleep waiting for memory |
| `M_NOWAIT` | Return NULL immediately if no memory |
| `M_ZERO` | Zero-initialize allocated memory |
| `M_USE_RESERVE` | Allow using emergency reserve |

## Statistics

Per-type tracking:
- `ks_memuse` - Current bytes in use
- `ks_size` - Size of allocations
- `ks_callout` - Allocation count
- `ks_free` - Free count

## Includes

- `sys/malloc.h` - malloc type definitions
- `vm/vm_map.h` - Virtual memory maps
- `vm/vm_page.h` - Physical page management
- `vm/uma.h` - UMA allocator

## Depends On

- Backend for all kernel dynamic memory
- Used by every kernel subsystem
- `vm/uma.c` for actual allocation