# sys/dev/virtio/ — VirtIO Device Drivers Codebase Map

**Path:** `sys/dev/virtio/`
**Purpose:** VirtIO para-virtualized device drivers

## Overview

VirtIO provides para-virtualized devices for virtualization.

## Key Files

| File | Purpose |
|------|---------|
| `virtio.c` | Core |
| `virtiovar.h` | Variables |
| `virtio_bus.h` | Bus |

## VirtIO Devices

| Device | Description |
|--------|-------------|
| `virtio_blk/` | Block device |
| `virtio_scsi/` | SCSI |
| `virtio_network/` | Network |
| `virtio_balloon/` | Balloon |
| `virtio_9p/` | 9P filesystem |
| `virtio_rng/` | Random |

## virtio_blk/

| File | Purpose |
|------|---------|
| `if_ virtio_blk.c` | Block device |

## virtio_network/

| File | Purpose |
|------|---------|
| `if_vtnet.c` | Network |

## See Also

- `lib/libvmmapi/` - VMM API