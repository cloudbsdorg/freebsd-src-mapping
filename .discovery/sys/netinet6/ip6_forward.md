# Component: ip6_forward.c

**Path:** `sys/netinet6/ip6_forward.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/ip6_forward.md`

## Purpose

IPv6 forwarding - Forward IPv6 packets to next hop.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip6_forward` | Forward | `int ip6_forward(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `forward` | Packet forwarding |

## Includes

- `netinet6/ip6.h` - IPv6 definitions
- `netinet6/ip6_var.h` - IPv6 variables