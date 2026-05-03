# Component: ip6_input.c

**Path:** `sys/netinet6/ip6_input.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/ip6_input.md`

## Purpose

IPv6 input - Main IPv6 packet input processing.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip6_input` | Input | `void ip6_input(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `input` | Input processing |

## Includes

- `netinet6/ip6.h` - IPv6 definitions
- `netinet6/ip6_var.h` - IPv6 variables