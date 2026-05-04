# Codebase Map: sys/dev/thunderbolt

**Path:** `sys/dev/thunderbolt/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/thunderbolt/CODEBASE_MAP.md`

## Summary

Intel Thunderbolt driver. Supports Thunderbolt devices and PCIe tunneling over Thunderbolt.

## Components

| File | Purpose |
|------|---------|
| nhi.c | Native host interface |
| router.c | Thunderbolt router |
| tb_dev.c | Device management |
| tb_pcib.c | PCIe bridge support |
| hcm.c | Host controller manager |
| tb_acpi_pcib.c | ACPI PCIe bridge |

## Dependencies

- `sys/dev/thunderbolt/` - Thunderbolt protocol