# Codebase Map: sys/dev/fdc

**Path:** `sys/dev/fdc/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/fdc/CODEBASE_MAP.md`

## Summary

Floppy Disk Controller driver.

## Components

| File | Purpose |
|------|---------|
| fdc.c | Main driver |
| fdc_isa.c | ISA bus support |
| fdc_acpi.c | ACPI support |

## Dependencies

- `sys/dev/fdc/` - Floppy subsystem