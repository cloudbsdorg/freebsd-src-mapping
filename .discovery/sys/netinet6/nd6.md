# Component: nd6.c

**Path:** `sys/netinet6/nd6.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/nd6.md`

## Purpose

IPv6 ND - Neighbor Discovery main implementation.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `nd6_input` | Input | `void nd6_input(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `nd` | Neighbor Discovery |

## Includes

- `netinet6/nd6.h` - ND definitions