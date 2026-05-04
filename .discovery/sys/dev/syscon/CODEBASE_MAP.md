# Codebase Map: sys/dev/syscon

**Path:** `sys/dev/syscon/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/syscon/CODEBASE_MAP.md`

## Summary

System controller framework. Provides access to system control registers.

## Components

| File | Purpose |
|------|---------|
| syscon.c | Core syscon driver |
| syscon_generic.c | Generic syscon |
| syscon_power.c | Power management |
| syscon_if.m | Interface definition |

## Dependencies

- `sys/dev/syscon/` - System controller subsystem