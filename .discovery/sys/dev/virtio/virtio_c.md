# Component: virtio.c

**Path:** `sys/dev/virtio/virtio.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/virtio/virtio_c.md`

## Decomposition

#### Device IDs
VIRTIO_ID_NETWORK, VIRTIO_ID_BLOCK, VIRTIO_ID_CONSOLE, VIRTIO_ID_ENTROPY, VIRTIO_ID_BALLOON, VIRTIO_ID_SCSI, VIRTIO_ID_GPU, VIRTIO_ID_CRYPTO, VIRTIO_ID_SOUND, VIRTIO_ID_FS, etc.

## Purpose

Core Virtio framework. Handles device identification, feature negotiation, and common virtio operations.

## Dependencies

- `dev/virtio/virtio.h` - Main header
- `dev/virtio/virtqueue.h` - Virtqueue definitions