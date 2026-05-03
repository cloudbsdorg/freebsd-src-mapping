# lib/libnetmap/ — Netmap Library Codebase Map

**Path:** `lib/libnetmap/`
**Purpose:** Netmap packet I/O library

## Overview

libnetmap provides userland access to netmap.

## Key Files

| File | Purpose |
|------|---------|
| `netmap.h` | Header |
| `netmap_user.h` | User structures |

## Key Structures

```c
struct nmreq {
    char nr_name[IFNAMSIZ];
    uint32_t nr_version;
    uint32_t nr_offset;
    uint32_t nr_memsize;
    uint32_t nr_tx_slots;
    uint32_t nr_rx_slots;
    // ... more
};

struct netmap_if *nifp;  // pointer to netmap_if
struct netmap_ring *rxring, *txring;
struct netmap_slot *slot;
```

## Key Functions

```c
int open(const char *name, int flags);
int ioctl(int fd, NIOCGINFO, struct ifreq *);
struct nmreq *mmap(int fd, struct nmreq *);
int ioctl(int fd, NIOCTXSYNC, struct ifreq *);
int ioctl(int fd, NIOCRXSYNC, struct ifreq *);
```

## See Also

- `sys/dev/netmap/` - Kernel netmap