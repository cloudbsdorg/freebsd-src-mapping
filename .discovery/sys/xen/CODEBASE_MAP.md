# sys/xen/ — Xen Hypervisor Support Codebase Map

**Path:** `sys/xen/`
**Purpose:** Xen hypervisor guest support

## Overview

The xen directory contains support for running FreeBSD as a Xen guest or para-virtualized host.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `xen/` | Core Xen |
| `xen/evtchn/` | Event channels |
| `xen/balloon/` | Memory balloon |
| `xen/granttable/` | Grant tables |
| `xen/pvbus/` | PV bus |

## Key Files

| File | Purpose |
|------|---------|
| `xen/xen.c` | Xen core |
| `xen/xen_intr.c` | Xen interrupts |
| `xen/xen_pv.c` | PV support |
| `xen/xenstore.c` | Xenstore |

## Xen Features

- PV guests (paravirtualized)
- HVM guests (hardware virtualized)
- PVH guests (PV in HVM)
- Xenstore communication
- Event channels
- Grant tables

## Key Structures

```c
struct xen_softc {
    device_t dev;
    u_long xen_version;
    int xen_features;
    struct mtx lock;
};
```

## See Also

- `sys/amd64/` - AMD64