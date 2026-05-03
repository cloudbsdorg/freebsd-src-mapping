# Component: accf_dns.c

**Path:** `sys/netinet/accf_dns.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/accf_dns.md`

## Purpose

Accept filter DNS - accept filter for DNS request detection.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `accf_dns` | DNS filter | `ACCEPT_FILTER_DEFINE(accf_dns, "dnsready", ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `accf` | Accept filter |
| `dns` | DNS |

## Includes

- `sys/socketvar.h` - Socket variables