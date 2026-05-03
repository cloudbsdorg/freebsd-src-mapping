# Component: vfs_lookup.c

**Path:** `sys/kern/vfs_lookup.c`
**Type:** File
**Maps to:** `.discovery/sys/kern/vfs_lookup.md`

## Purpose

Pathname lookup - implements namei() and related functions for converting pathnames to vnodes. Handles symbolic links, "." and ".." components, and mount point crossing.

## Structure

```mermaid
flowchart TD
    A[namei - lookup path] --> B[parse path components]
    B --> C[get directory vnode]
    C --> D[VOP_LOOKUP - lookup name]
    D --> E{more components?}
    E -->|Yes| C
    E -->|No| F[return vnode]
    G[link() - follow symlink] --> H[copy str to buffer]
    H --> I[loop up to MAXSYMLINKS]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `namei` | Main lookup | `int namei(struct nameidata *ndp)` |
| `nameiat` | Relative lookup | `int nameiat(int fd, struct nameidata *ndp)` |
| `ndp` | Nameidata init | `void NDHINIT(ndp)(struct nameidata *ndp, ...)` |
| `lookup` | Component lookup | `int lookup(struct nchandle *ncp)` |
| `cache_lookup` | Vnode cache | `int cache_lookup(struct vnode *dvp, ...)` |
| `cache_enter` | Add to cache | `void cache_enter(struct vnode *dvp, ...)` |
| `cache_purge` | Purge entry | `void cache_purge(struct vnode *vp)` |
| `symlink` | Follow symlink | `int symlink(struct nameidata *ndp, ...)` |

## Nameidata Flags

| Flag | Description |
|------|-------------|
| `NDF_ONLY_PNC` | Only pn lookup |
| `NDF_NO_DROP` | Don't drop ref |
| `NDF_NO_RELOOK` | No re-lookup |
| `NDF_UPPATH` | Traverse .. |
| `NDF_WANTPARENT` | Want parent |

## Lookup Flags

| Flag | Description |
|------|-------------|
| `LOOKUP` | Base lookup |
| `LOOKUP_ROOT` | Root based |
| `NOOBJ` | Don't open obj |
| `WANTPARENT` | Want parent |

## Path Components

| Component | Description |
|-----------|-------------|
| `.` | Current directory |
| `..` | Parent directory |
| symlink | Follow symbolic link |

## Includes

- `sys/namei.h` - Namei definitions
- `sys/vnode.h` - Vnode operations
- `sys/mount.h` - Mount points

## Depends On

- `vfs_subr.c` for VFS utilities
- `vfs_vnops.c` for VOP_LOOKUP