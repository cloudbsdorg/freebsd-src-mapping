# sys/kern/vfs/ — Virtual File System Codebase Map

**Path:** `sys/kern/vfs/`
**Purpose:** VFS layer

## Overview

Virtual File System abstraction layer.

## Key Files

| File | Purpose |
|------|---------|
| `vfs_subr.c` | VFS support |
| `vfsops.c` | File system operations |
| `vnode_if.src` | vnode interface |

## See Also

- `sys/kern/vfs/vfsops/` - FS operations
- `sys/kern/vfs/vnops/` - vnode operations