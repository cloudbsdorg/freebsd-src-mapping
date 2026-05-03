# Component: ip6_id.c

**Path:** `sys/netinet6/ip6_id.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/ip6_id.md`

## Purpose

IPv6 fragment ID generation.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip6_id` | Generate ID | `uint32_t ip6_id(struct mbuf *m)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `fragment` | Fragment ID |

## Includes

- `netinet6/ip6.h` - IPv6 definitions