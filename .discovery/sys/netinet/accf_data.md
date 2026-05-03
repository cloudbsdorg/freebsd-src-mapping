# Component: accf_data.c

**Path:** `sys/netinet/accf_data.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/accf_data.md`

## Purpose

Accept filter data - accept filter that holds socket until data arrives.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `accf_data` | Data filter | `ACCEPT_FILTER_DEFINE(accf_data, "dataready", ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `accf` | Accept filter |
| `data` | Data ready |

## Includes

- `sys/socketvar.h` - Socket variables