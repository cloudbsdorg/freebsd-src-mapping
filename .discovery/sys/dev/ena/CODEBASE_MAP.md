# Codebase Map: sys/dev/ena

**Path:** `sys/dev/ena/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/ena/CODEBASE_MAP.md`

## Summary

Elastic Network Adapter (ENA) driver. Supports Amazon Web Services (AWS) ENA devices for enhanced networking.

## Components

| File | Purpose |
|------|---------|
| ena.c | Main driver |
| ena.h | Header |
| ena_datapath.c | Data path |
| ena_netmap.c | Netmap support |
| ena_rss.c | RSS support |
| ena_sysctl.c | Sysctl interface |

## Dependencies

- `sys/dev/ena/` - AWS ENA