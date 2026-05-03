# Component: raw_ip6.c

**Path:** `sys/netinet6/raw_ip6.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/raw_ip6.md`

## Purpose

Raw IPv6 - raw socket protocol for IPv6.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `rip6_input` | Input | `void rip6_input(struct mbuf *m, int off)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `raw` | Raw socket |
| `ipv6` | IPv6 |

## Includes

- `netinet6/raw_ip6.h` - Raw IPv6 definitions