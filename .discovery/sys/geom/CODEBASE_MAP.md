# sys/geom/ — GEOM Disk Framework Codebase Map

**Path:** `sys/geom/`
**Files:** 13 C source files
**Purpose:** Modular disk I/O framework providing transformation pipelines

## Overview

GEOM is a modular framework for disk I/O. It allows stacking of transformation classes (like RAID, encryption, journaling) on top of providers (disk devices). The framework is tree-based where each class can modify or intercept I/O requests.

## Core Framework Files

| File | Purpose | Key Structures |
|------|---------|---------------|
| `geom_kern.c` | Core kernel integration | `g_class`, `g_provider`, `g_geom` |
| `geom_io.c` | I/O request handling | `g_bio`, `g_io_request` |
| `geom_subr.c` | Subsidiaries | Helper functions |
| `geom_event.c` | Event handling | Event callbacks |
| `geom_vfs.c` | VFS integration | vnode operations |

### Key Structures

```c
struct g_class {
    const char      *name;           // Class name
    TAILQ_ENTRY(g_class) class;       // Class list
    TAILQ_HEAD(, g_geom) geom;       // Geoms of this class
    TAILQ_HEAD(, g_provider) provider;// Providers of this class
    int             (*taste)(gcp, mp, flags); // Attach to provider
    void            (*spinup)(g_geom);
    void            (*spindown)(g_geom);
    void            (*init)(g_geom);
    void            (*fini)(g_geom);
    void            (*orphan)(g_geom);
    // ... more methods
};

struct g_geom {
    struct g_class      *class;       // My class
    char                *name;        // Instance name
    TAILQ_ENTRY(g_geom) geom;          // In class list
    TAILQ_HEAD(, g_consumer) consumer; // Consumers (below)
    TAILQ_HEAD(, g_provider) provider; // Providers (above)
    void                *private;      // Class-specific
    struct bio_queue_head start_queue; // Bio queue
    int                 rank;         // Rank in tree
};

struct g_provider {
    struct g_geom        *geom;        // My geom
    char                 name[64];     // Provider name
    u_int                sectorsize;  // Sector size
    u_int64_t            size;         // Size in sectors
    struct g_consumer    *acr;         // Access counts
    struct g_consumer    *acw;
    struct g_consumer    *ace;
    struct bio_queue_head queue;       // Request queue
    int                  flags;       // PFLAG_* flags
};

struct g_consumer {
    struct g_geom         *geom;       // My geom
    struct g_provider     *provider;   // Attached provider
    void                  *private;    // Class-specific
    int                   refcnt;      // Reference count
    struct bbio {
        TAILQ_ENTRY(bbio) chain;
        struct bio        *bio;
    };
};
```

### Bio (Block I/O) Structure

```c
struct bio {
    struct bio            *bio_parent; // Originating bio
    struct g_geom         *bio_geom;   // Target geom
    struct g_provider     *bio_provider; // Target provider
    struct g_consumer     *bio_consumer; // Source consumer
    enum g_bio_type       bio_cmd;     // BIO_DELETE, BIO_READ, BIO_WRITE, etc.
    daddr_t               bio_offset;  // Offset in sectors
    long                  bio_length;  // Length in bytes
    long                  bio_maoffset;
    long                  bio_maowner;  // owner for bio->bio_ma
    void                  *bio_data;   // Data buffer
    void                  (*bio_done)(struct bio *);
    int                   bio_error;   // Error code
    int                   bio_resid;   // Residual count
    int                   bio_attributes;
    struct bbio           *bio_inbed;
    struct bbio           *bio_temporary;
    struct callout        bio_timer;
    struct proc           *bio_procp;
};
```

## Device & Disk

| File | Purpose |
|------|---------|
| `geom_disk.c` | `g_disk_*` - Disk provider |
| `geom_dev.c` | `g_dev_*` - Device node |
| `geom_ctl.c` | `g_ctl_*` - Control device |

## Transformation Classes

| File | Class | Purpose |
|------|-------|---------|
| `geom_slice.c` | `mirror` (BSD slice) | Disk partitioning |
| `geom_bsd_enc.c` | `bde` | BSD disklabel encryption |
| `geom_ccd.c` | `ccd` | Concatenated disk |
| `geom_flashmap.c` | (internal) | Flash map |

## Provider/Consumer Attachment

```c
// Consumer attaches to provider
g_provider_open(provider, access_flags, consumer);
g_provider_close(provider, consumer);

// Read/Write/Delete
g_access(consumer, nread, nwrite, nexclusive);

// Request I/O
g_io_request(bio, consumer);
```

## Bio Flow Through GEOM Tree

```
User Request (read/write)
    │
    ▼
Top Provider (geom_dev)
    │
    │ g_io_request()
    ▼
Geom (e.g., mirror)
    │
    │ g_io_request() to each member
    ▼
Bottom Consumer (attached to disk)
    │
    ▼
Disk Device
```

## Class Stacking Example

```
geom_disk (provider: da0)
    │
    └── geom_slice (provider: da0s1)
            │
            └── geom_mount (provider: /dev/da0s1a)
                    │
                    └── VFS
```

## VFS Integration

```c
// geom_vfs.c
struct g_vfs_attach {
    struct mount    *mp;
    struct g_provider *provider;
};

int g_vfs_mount(struct mount *mp, const char *path,
    struct g_provider *provider, struct mtf *td);
int g_vfs_unmount(struct mount *mp, int mnt_flags);
```

## Bio Commands

```c
enum g_bio_type {
    BIO_READ = 0,      // Read data
    BIO_WRITE = 1,     // Write data
    BIO_DELETE = 2,    // Delete/free blocks
    BIO_GETATTR = 3,   // Get attributes
    BIO_FLUSH = 4,     // Flush cache
    BIO_SPEED = 5,     // Throughput hint
};
```

## Initialization

```c
// geom_kern.c
static int
g_init(void)
{
    g_class_init();
    g_event_init();
    // ... register classes
}

static void
g_uninit(void)
{
    // ... unregister classes
    g_event_fini();
    g_class_fini();
}
```

## Event System

```c
// geom_event.c
void g_post_event(int (*event)(struct g_geom *, void *),
    void *arg, int flags, struct g_geom *geom);
void g_cancel_event(void *ref);
int g_waitfor_event(int (*event)(struct g_geom *, void *),
    void *arg, int flags);
```

## Key Dependencies

```c
#include <sys/bio.h>           // Bio structure
#include <sys/geom.h>          // GEOM classes
#include <geom/geom_disk.h>    // Disk class
#include <geom/geom_slice.h>   // Slice class
```

## sysctl Variables

```
kern.geom.debugflags
kern.geom.label.* (disk labels)
```

## See Also

- `sys/kern/vfs_subr.c` - VFS
- `sys/kern/vfs_bio.c` - Buffer I/O
- `sys/dev/disk/` - Disk drivers