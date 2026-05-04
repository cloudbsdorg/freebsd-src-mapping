# Codebase Map: sys/dev/cpufreq

**Path:** `sys/dev/cpufreq/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/cpufreq/CODEBASE_MAP.md`

## Summary

CPU frequency scaling drivers. Controls CPU clock speed for power management.

## Components

| File | Purpose |
|------|---------|
| cpufreq_dt.c | Device Tree CPUfreq |
| ichss.c | Intel SpeedStep |

## Dependencies

- `sys/cpu/` - CPU subsystem