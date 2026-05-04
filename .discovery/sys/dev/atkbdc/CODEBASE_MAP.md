# Codebase Map: sys/dev/atkbdc

**Path:** `sys/dev/atkbdc/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/atkbdc/CODEBASE_MAP.md`

## Summary

AT Keyboard Controller driver. Provides PS/2 keyboard and mouse support.

## Components

| File | Purpose |
|------|---------|
| atkbdc.c | AT keyboard controller |
| atkbd.c | AT keyboard |
| atkbd_atkbdc.c | AT keyboard driver |
| atkbdc_isa.c | ISA bus support |
| atkbdc_subr.c | Subroutines |
| psm.c | PS/2 mouse |

## Dependencies

- `sys/dev/atkbdc/` - Keyboard/mouse subsystem