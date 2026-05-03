# sys/dev/ntb/ — Non-Transparent Bridge Codebase Map

**Path:** `sys/dev/ntb/`
**Purpose:** Non-Transparent Bridge for加速

## Overview

The ntb driver supports Non-Transparent Bridge devices for node-to-node communication.

## Key Files

| File | Purpose |
|------|---------|
| `ntb.c` | Core |
| `ntb_hw.h` | Hardware |
| `ntb_transport.c` | Transport |

## Key Functions

```c
struct ntb_softc *ntb_create_ctx(device_t dev);
int ntb_setup_transport(struct ntb_softc *, struct ntb_transport_ctx *);
int ntb_peer_spad_read(struct ntb_softc *, int, size_t, u32 *);
int ntb_peer_spad_write(struct ntb_softc *, int, size_t, u32);
```

## See Also

- `sys/dev/pci/` - PCI