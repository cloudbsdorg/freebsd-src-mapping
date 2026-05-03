# Component: icmp6.c

**Path:** `sys/netinet6/icmp6.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/icmp6.md`

## Purpose

ICMPv6 - Internet Control Message Protocol for IPv6.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `icmp6_input` | Input | `void icmp6_input(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `icmp` | ICMP messages |

## Includes

- `netinet6/icmp6.h` - ICMPv6 definitions