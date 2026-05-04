# Codebase Map: sys/dev/ofw

**Path:** `sys/dev/ofw/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/ofw/CODEBASE_MAP.md`

## Summary

OpenFirmware framework. Device tree support for ARM/PowerPC.

## Components

| File | Purpose |
|------|---------|
| ofw_bus.c | Bus framework |
| ofw_pci.c | PCI binding |
| ofw_fdt.c | FDT binding |
| ofw_cpu.c | CPU nodes |
| ofw_console.c | Console |
| ofw_graph.c | Device graph |

## Dependencies

- `sys/dev/ofw/` - OpenFirmware subsystem