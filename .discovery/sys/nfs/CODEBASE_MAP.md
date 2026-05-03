# sys/nfs/ — NFS Common Codebase Map

**Path:** `sys/nfs/`, `sys/nfsclient/`, `sys/nfsserver/`
**Purpose:** Network File System implementation

## Overview

The NFS directories contain NFS client and server implementations. The `nfs/` directory contains shared code used by both.

## nfs/ — Common NFS Code

| File | Purpose |
|------|---------|
| `bootp_subr.c` | Bootp/NFS diskless |
| `krpc_subr.c` | Kernel RPC |
| `nfs_diskless.c` | Diskless boot |
| `nfs_nfssvc.c` | NFS svc (server) |
| `nfs_kdtrace.h` | DTrace |
| `nfs_lock.h` | Locking |
| `nfs_mountcommon.h` | Common mount |

## nfsclient/ — NFS Client

| File | Purpose |
|------|---------|
| `nfs.h` | Main header |
| `nfsargs.h` | NFS arguments |
| `nfsmount.h` | Mount structure |
| `nfsnode.h` | vnode for NFS |
| `nfsstats.h` | Statistics |

## nfsserver/ — NFS Server

| File | Purpose |
|------|---------|
| `nfs.h` | Main header |
| `nfsrvstats.h` | Server statistics |

## NFS vnode Operations

```c
// nfsnode.h
struct nfsnode {
    struct vnode *n_vnode;         // vnode
    nfsfh_t      *n_fhp;            // File handle
    u_int8_t     n_fhsize;          // FH size
    u_int32_t    n_mode;            // Mode
    u_int64_t    n_size;            // Size
    // ... more
};
```

## NFS Mount

```c
// nfsmount.h
struct nfsmount {
    struct mount    *nm_mountp;     // VFS mount
    struct socket   *nm_sock;       // Socket
    struct sockaddr *nm_nam;        // Server addr
    char           *nm_path;       // Export path
    int            nm_proto;        // UDP/TCP
    // ... more
};
```

## NFS Version Support

| Version | Support |
|---------|---------|
| NFSv2 | Legacy |
| NFSv3 | Full |
| NFSv4 | Full |
| NFSv4.1 | pNFS |
| NFSv4.2 | Sparse |

## See Also

- `sys/rpc/` - SunRPC
- `sys/fs/nfs/` - NFS filesystem