# Component: route6.c

**Path:** `sys/netinet6/route6.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/route6.md`

## Purpose

IPv6 routing - routing for IPv6 packets.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `route6_input` | Input | `int route6_input(struct mbuf **mp, int *offp, int proto)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `routing` | Routing |

## Includes

- `netinet6/ip6_var.h` - IPv6 variables