# Codebase Map: sys/dev/regulator

**Path:** `sys/dev/regulator/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/regulator/CODEBASE_MAP.md`

## Summary

Voltage regulator framework. Provides control for power regulation.

## Components

| File | Purpose |
|------|---------|
| regulator.c | Core regulator driver |
| regulator_fixed.c | Fixed voltage regulator |
| regulator_bus.c | Bus support |
| regdev_if.m | Device interface |
| regnode_if.m | Regulator node interface |

## Dependencies

- `sys/dev/regulator/` - Regulator framework