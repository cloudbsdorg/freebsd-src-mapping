# Codebase Map: sys/dev/fdt

**Path:** `sys/dev/fdt/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/fdt/CODEBASE_MAP.md`

## Summary

Flattened Device Tree (FDT) framework. Provides device tree support for ARM and other architectures.

## Components

| File | Purpose |
|------|---------|
| fdt_common.c | FDT parsing |
| simplebus.c | Simple bus driver |
| fdt_clock.c | Clock binding |
| fdt_pinctrl.c | Pin control binding |
| fdt_slicer.c | DTB slicing |

## Dependencies

- `sys/dev/fdt/` - FDT subsystem