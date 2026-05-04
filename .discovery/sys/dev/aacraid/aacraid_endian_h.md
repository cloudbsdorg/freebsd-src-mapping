# Component: aacraid_endian.h

**Path:** `sys/dev/aacraid/aacraid_endian.h`
**Type:** Header
**Maps to:** `.discovery/sys/dev/aacraid/aacraid_endian_h.md`

## Decomposition

#### Conversion Macros
- aac_fib_header_toh, aac_adapter_info_toh, aac_container_creation_toh, etc. (TOH - to host order)
- aac_adapter_init_tole, aac_fib_header_tole, aac_mntinfo_tole, etc. (TOLE - to little-endian)

## Purpose

Endian conversion macros for FIB data structures. Empty macros on little-endian hosts, function calls on big-endian.

## Dependencies

- `<sys/endian.h>`