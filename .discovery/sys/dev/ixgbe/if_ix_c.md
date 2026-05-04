# Component: if_ix.c

**Path:** `sys/dev/ixgbe/if_ix.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/ixgbe/if_ix_c.md`

## Decomposition

#### Version
5.0.1-k

## Purpose

Main Intel 10GbE driver for 82598/82599/x540 devices. Handles device initialization, TX/RX, interrupt moderation, and management.

## Dependencies

- `ixgbe.h` - Main header
- `ixgbe_sriov.h` - SR-IOV support
- `ifdi_if.m` - Device interface