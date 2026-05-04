# Codebase Map: sys/dev/cfi

**Path:** `sys/dev/cfi/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/cfi/CODEBASE_MAP.md`

## Summary

Common Flash Interface driver. Supports parallel NOR flash.

## Components

| File | Purpose |
|------|---------|
| cfi_core.c | Core CFI driver |
| cfi_bus_fdt.c | FDT bus |
| cfi_disk.c | Flash disk |
| cfi_dev.c | Device support |

## Dependencies

- `sys/dev/cfi/` - Flash subsystem