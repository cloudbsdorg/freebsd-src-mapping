# Component: in_rss.c

**Path:** `sys/netinet/in_rss.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_rss.md`

## Purpose

INET RSS - Receive Side Scaling hash for IPv4.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `in_rss_hash` | Hash | `uint32_t in_rss_hash(struct in_addr *src, struct in_addr *dst)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `rss` | RSS hashing |
| `ipv4` | IPv4 |

## Includes

- `netinet/in_rss.h` - RSS definitions