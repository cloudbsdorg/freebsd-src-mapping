# sys/fs/ — Filesystem Implementations Codebase Map

**Path:** `sys/fs/`
**Files:** 122 C source files across 22 filesystem subdirectories
**Purpose:** Filesystem implementations (disk-based, network, virtual)

## Overview

The fs/ directory contains individual filesystem implementations. Each lives in its own subdirectory. VFS (Virtual File System) core is in sys/kern/vfs_subr.c.

## Filesystem Subdirectories

### Disk-Based Filesystems

| Directory | Filesystem | Description |
|-----------|------------|-------------|
| `ufs/` | UFS/FFS | BSD Fast File System (with soft updates) |
| `ufs/ffs/` | FFS | Berkeley Fast File System |
| `ufs/ufs/` | UFS | Basic UFS |
| `ufs/ufs/quota.c` | UFS Quotas | Per-user disk quotas |
| `ufs/ufs/ufs_vnops.c` | UFS vnodeops | UFS vnode operations |

### Network Filesystems

| Directory | Filesystem | Description |
|-----------|------------|-------------|
| `nfs/` | NFS | Network File System (client+server combined) |
| `nfsclient/` | NFS client | NFS client only |
| `nfsserver/` | NFS server | NFS server only |
| `smbfs/` | SMB/CIFS | SMB client (Samba) |

### Virtual Filesystems

| Directory | Filesystem | Description |
|-----------|------------|-------------|
| `nullfs/` | NULLFS | Loopback filesystem |
| `unionfs/` | UNIONFS | Union mount |
| `tmpfs/` | TMPFS | Memory-based filesystem |
| `pseudofs/` | PSEUDOFS | Fake filesystem framework |
| `devfs/` | DEVFS | Device node filesystem |
| `fdescfs/` | FDESCFS | File descriptor filesystem |
| `procfs/` | PROCFS | Process filesystem (/proc) |
| `autofs/` | AUTOFS | Auto-mount filesystem |
| `mntfs/` | MNTFS | Mount filesystem |
| `deadfs/` | DEADFS | Dead filesystem (placeholder) |
| `fifofs/` | FIFIFS | FIFO/pipe filesystem |

### Other Filesystems

| Directory | Filesystem | Description |
|-----------|------------|-------------|
| `cd9660/` | ISO9660 | CD-ROM filesystem |
| `msdosfs/` | FAT | MS-DOS filesystem |
| `ext2fs/` | ext2/ext3/ext4 | Linux ext2/ext3/ext4 |
| `udf/` | UDF | Universal Disk Format |
| `tarfs/` | TAR | TAR archive filesystem |
| `fuse/` | FUSE | Filesystem in Userspace |
| `cuse/` | CUSE | Character device in userspace |
| `p9fs/` | Plan 9 | Plan 9 filesystem (experimental) |

## Common Vnode Operations

Each filesystem implements vnode operations:

```c
struct vnodeops {
    vop_create_t      *vop_create;
    vop_whiteout_t    *vop_whiteout;
    vop_mknod         *vop_mknod;
    vop_open          *vop_open;
    vop_close         *vop_close;
    vop_access        *vop_access;
    vop_accessx       *vop_accessx;
    vop_getattr       *vop_getattr;
    vop_setattr       *vop_setattr;
    vop_read          *vop_read;
    vop_write         *vop_write;
    vop_ioctl         *vop_ioctl;
    vop_poll          *vop_poll;
    vop_kqfilter      *vop_kqfilter;
    vop_remove        *vop_remove;
    vop_rename        *vop_rename;
    vop_mkdir         *vop_mkdir;
    vop_rmdir         *vop_rmdir;
    vop_getdirent     *vop_getdirent;
    vop_symlink       *vop_symlink;
    vop_readlink      *vop_readlink;
    vop_inactive      *vop_inactive;
    vop_reclaim       *vop_reclaim;
    vop_lock1         *vop_lock1;
    vop_unlock        *vop_unlock;
    vop_bmap          *vop_bmap;
    vop_strategy      *vop_strategy;
    vop_getpages      *vop_getpages;
    vop_putpages      *vop_putpages;
    vop_pathconf      *vop_pathconf;
    vop_advlock       *vop_advlock;
    vop_reallocblk    *vop_reallocblk;
    vop_bwrite        *vop_bwrite;
};
```

## UFS/FFS Structure

### Inodes

```c
// ufs/ufs/ufs inode
struct ufsinode {
    struct vnode      *u_vnode;
    struct inode       u_din;          // On-disk inode
    // ...
};

// ufs/ffs/FFS specific
struct ffs inode {
    struct ufs inode;                  // Embedded
    // FFS-specific fields
};
```

### Superblock

```c
struct fs {
    int32_t    fs_firstfield;           // Magic number etc
    int32_t    fs_volname;              // Volume name
    u int64_t  fs_size;                 // Number of blocks
    u int64_t  fs_dsize;                // Data blocks
    // ... many more fields
#define    FS MAGIC    0x011954
};
```

## NFS Structure

### NFS Client (nfsclient/)

```c
struct nfsrvdhashhead { /* ... */ };
struct nfsmount {                    // Mount info
    struct mount    *nm_mountp;       // VFS mount
    struct sockaddr *nm_nam;          // Server address
    int            nmソktype;          // Socket type
    // ... more
};

struct nfsnode {                     // NFS file handle
    struct vnode   *n_vnode;         // vnode
    u_int8_t       *n_fhp;           // File handle
    int            n_fhlen;          // FH length
    // ... more
};
```

### NFS Server (nfsserver/)

```c
struct nfsrvd_head { /* ... */ };
// Server-side VFS ops
struct nfsv4_statehead { /* ... */ };
```

## TMPFS Structure

```c
struct tmpfs_mount {
    struct mount    *tm_mount;
    struct tmpfs_node *tm_root;      // Root node
    struct pool     *tm_node_pool;    // Node pool
    u_int64_t      tm_max_size;      // Max size
};

struct tmpfs_node {
    struct vnode   *tn_vnode;
    enum tmpfs_nodetype tn_type;     // VREG, VDIR, VLNK, VCHR, VBLK, VFIFO, VSOCK
    uid_t          tn_uid;           // Owner
    gid_t          tn_gid;           // Group
    mode_t         tn_mode;         // Mode
    // ... more
};
```

## DEVFS Structure

```c
struct devfs_mount {
    struct mount    *dm_mount;
    struct vnode    *dm_root;        // Root vnode
    TAILQ_HEAD(, devfs_dirent) dm_head; // Entries
};

struct devfs_dirent {
    char           *de_dir;          // Name
    struct vnode   *de_vnode;        // vnode
    struct cdevsw   *de_cdevsw;     // Char device switch
    // ... more
};
```

## Mount Structure

```c
struct mount {
    struct vfsops   *mnt_vfc->vfc_vfsops;
    struct vnode    *mnt_vnodecovered; // Covered vnode
    struct vnode    *mnt_root;          // Root vnode
    char            mnt_stat.f_mntonname; // Mount point
    char            mnt_stat.f_mntfromname; // From (device)
    int             mnt_flag;           // Flags
    struct export_options *mntExport;   // Export options
    void            *mnt_data;          // Filesystem-specific
};
```

## Mount Flow

```
user: mount(2)
    │
    ▼
syscalls_*.c: mount()
    │
    ▼
vfs_mount()
    │
    ▼
Filesystem-specific mount (e.g., ffs_mount())
    │
    ▼
Allocates mount struct
Attaches to vfs_conf
Returns to user
```

## Key Dependencies

```c
#include <sys/mount.h>               // VFS mount
#include <sys/vnode.h>               // Vnode
#include <sys/buf.h>                 // Buffer cache
#include <sys/fnvfs.h>               // FNVFS (used internally)
```

## sysctl Variables

```
vfs.cachepressure
vfs.read_max
vfs.usermount
vfs.sync.flush
```

## See Also

- `sys/kern/vfs_subr.c` - VFS core
- `sys/kern/vfs_bio.c` - Buffer cache
- `sys/geom/` - GEOM disk framework