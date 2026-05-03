# sys/vm/ — Virtual Memory System Codebase Map

**Path:** `sys/vm/`
**Files:** 26 C source files
**Purpose:** Virtual memory subsystem management

## Overview

The VM system manages address spaces, physical memory, and paging. It provides the foundation for memory-mapped files, process isolation, and demand paging.

## Core VM Files

### Address Space Management

| File | Purpose | Key Structures/Functions |
|------|---------|----------------------|
| `vm_map.c` | Address space maps | `vm_map_t`, `vm_map_entry_t`, `vm_map_lookup()` |
| `vm_mmap.c` | mmap syscall | `sys_mmap()`, `vm_mmap()` |
| `vm_fault.c` | Page fault handling | `vm_fault()`, `vm_fault_pagein()` |
| `vm_glue.c` | Kernel glue | `vm_map_startup()` |

**Key Structures:**
```c
struct vm_map {
    struct radix_node *hdr;      // Tree of entries
    vm_size_t size;              // Virtual size
    int nentries;                // Entry count
    struct vm_map_entry *hint;   // Last accessed
    struct vm_map_entry *first_free;
    pmap_t pmap;                // Physical map
    struct lock lock;            // Map lock
};

struct vm_map_entry {
    struct radix_node start_info;
    vm_offset_t start;           // Start address
    vm_offset_t end;             // End address
    vm_offset_t offset;         // File offset (if file-backed)
    struct vm_object *object;    // Backing object
    vm prot_t protection;        // Protection bits
    vm prot_t max_protection;    // Max allowed
    unsigned int wired_count;    // Wiring count
};
```

### Physical Memory Management

| File | Purpose | Key Structures/Functions |
|------|---------|----------------------|
| `vm_page.c` | Physical page management | `vm_page_t`, `vm_page_alloc()` |
| `vm_phys.c` | Physical memory zones | `vm_phys_*()` |
| `vm_pageout.c` | Page daemon | `vm_pageout_*()` |

**Page States:**
- **FREE** - Available for allocation
- **INACTIVE** - Not recently accessed, can be reclaimed
- **ACTIVE** - Currently in use
- **WIRED** - Permanently mapped, cannot be paged out
- **BUSY** - Temporarily unavailable

### Virtual Memory Objects

| File | Purpose | Key Structures/Functions |
|------|---------|----------------------|
| `vm_object.c` | VM objects | `vm_object_t`, `vm_object_alloc()` |
| `vnode_pager.c` | Vnode-backed objects | `vnode_pager_*()` |
| `device_pager.c` | Device-backed objects | `device_pager_*()` |
| `phys_pager.c` | Physical device pager | `phys_pager_*()` |
| `swap_pager.c` | Swap-backed objects | `swap_pager_*()` |

**Object Types:**
```c
enum obj_type {
    OBJT_DEFAULT,      // Anonymous memory
    OBJT_SWAP,         // Swap-backed
    OBJT_VNODE,        // File-backed (vnode)
    OBJT_DEVICE,       // Device memory
    OBJT_PHYS,         // Physical address
    OBJT_SG,           // Scatter/gather
};
```

### Pager Framework

| File | Purpose |
|------|---------|
| `vm_pager.c` | Pager abstract interface |
| `swap_pager.c` | Swap space management |
| `vnode_pager.c` | File-backed paging |
| `device_pager.c` | Device paging |
| `phys_pager.c` | Physical paging |

### UMA (Universal Memory Allocator)

| File | Purpose | Key Functions |
|------|---------|--------------|
| `uma_core.c` | UMA implementation | `uma_zalloc()`, `uma_zfree()` |
| `uma_dbg.c` | Debugging | Leak detection, validation |

**UMA Zones:**
```c
uma_zone_t zone_cache = uma_zcreate("CACHE", cache_size,
    NULL, NULL, NULL, NULL, UMA_ALIGN_PTR, 0);
```

### Reservations & Domains

| File | Purpose |
|------|---------|
| `vm_reserv.c` | Memory reservations |
| `vm_domainset.c` | NUMA domain management |

### Swap Management

| File | Purpose |
|------|---------|
| `vm_swapout.c` | Swap out daemon |
| `swap_pager.c` | Swap pager |

## Data Structures

### vm_page (Physical Page)
```c
struct vm_page {
    struct {
        TAILQ_ENTRY(vm_page) list;
        unsigned int wire_count;
        unsigned int flags;
        u_short psind;
        u_short pdp_idx;
    };
    vm_object_t object;         // Backing object
    vm_pindex_t pindex;        // Page index in object
    vm_offset_t phys_addr;      // Physical address
    struct md_page *md;         // Machine-dependent
};
```

### vm_object (Memory Object)
```c
struct vm_object {
    TAILQ_ENTRY(vm_object) object_list;
    enum obj_type type;         // Object type
    vm_size_t size;            // Object size
    TAILQ_HEAD(, vm_page) memq; // Pages in object
    int resident_count;         // Pages in memory
    struct vnode *vnode;       // If OBJT_VNODE
    struct swblock *swap;       // If OBJT_SWAP
    int generation;              // Object generation
};
```

## Page Fault Flow

```
1. CPU generates fault (read/write to unmapped page)
2. trap.c:trap() receives fault
3. vm_fault() called with fault type
4. Lookup address in vm_map
5. Find vm_map_entry and its backing object
6. If page not in memory:
   a. Allocate vm_page
   b. Call object's pager (vnode_pager, swap_pager, etc.)
   c. Fill page from backing store
7. If page exists but swapped out:
   a. Locate swap location
   b. Read from swap
8. Map page into process's pmap
9. Return to user context
```

## Initialization Sequence

```
vm_init()
  ├── vm_phys_init()           // Physical memory zones
  ├── vm_map_init()            // Kernel map
  ├── uma_startup()            // UMA slabs
  ├── vm_object_init()         // Object zone
  └── pageout daemon starts
```

## Relationships with Other Subsystems

```
┌─────────────────────────────────────────┐
│         sys/kern (VFS layer)             │
│   vfs_subr.c, vnode_pager.c            │
└─────────────────────────────────────────┘
                    │ creates/uses
                    ▼
┌─────────────────────────────────────────┐
│            sys/vm (VM core)              │
│   vm_map.c ←→ vm_object.c ←→ vm_page.c │
└─────────────────────────────────────────┘
                    │ maps to
                    ▼
┌─────────────────────────────────────────┐
│     Machine-dependent (pmap)             │
│   sys/amd64/amd64/pmap.c               │
└─────────────────────────────────────────┘
                    │ manages
                    ▼
┌─────────────────────────────────────────┐
│       Physical Memory (RAM)              │
└─────────────────────────────────────────┘
```

## Key Dependencies

```c
// vm_map.c includes:
#include <vm/vm.h>
#include <vm/vm_map.h>
#include <vm/vm_page.h>
#include <vm/vm_object.h>
#include <vm/pmap.h>
#include <vm/vm_pager.h>
#include <sys/proc.h>

// vm_page.c includes:
#include <vm/vm_page.h>
#include <vm/vm_object.h>
#include <vm/vm_pager.h>
#include <vm/uma.h>

// vm_object.c includes:
#include <vm/vm_object.h>
#include <vm/vm_page.h>
#include <vm/vm_pager.h>
```

## Allocator Summary

| Allocator | Purpose | Use Case |
|-----------|---------|----------|
| `malloc()`/`free()` | Kernel heap | General allocations |
| `uma_zalloc()`/`uma_zfree()` | Zone allocator | Fixed-size caches |
| `vm_map_*()` | Address space | mmap, process memory |
| `vm_page_alloc()` | Physical pages | Page allocation |
| `vm_reserv_*()` | Reservations | Large contiguous |

## sysctl Variables

```
vm.v_free_min          // Free page threshold
vm.v_free_reserved     // Reserved pages
vm.v_pageout_deficit   // Pageout deficit
vm.swap_enabled        // Swap on/off
vm.drop_PGF_request    // Emergency page drops
```

## See Also

- `sys/kern/vfs_subr.c` - VFS coordination
- `sys/kern/kern_malloc.c` - Kernel malloc
- `sys/amd64/amd64/pmap.c` - AMD64 pmap