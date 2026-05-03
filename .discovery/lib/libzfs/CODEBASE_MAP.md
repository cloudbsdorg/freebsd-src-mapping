# lib/libzfs/ — ZFS Library Codebase Map

**Path:** `lib/libzfs/`
**Purpose:** ZFS management library

## Overview

libzfs provides the ZFS management library for creating, destroying, and managing ZFS pools and datasets.

## Key Files

| File | Purpose |
|------|---------|
| `libzfs.h` | Header |
| `libzfs_pool.c` | Pool management |
| `libzfs_dataset.c` | Dataset management |
| `libzfs_import.c` | Pool import/export |

## Relationships

```mermaid
flowchart LR
    libzfs["libzfs"] --> libc["libc"]
    libzfs --> libnv["libnv"]
    libzfs --> libzfs_core["libzfs_core"]
```

## See Also

- `lib/libzfs_core/` - ZFS core library
- `usr.sbin/zfs/` - ZFS command