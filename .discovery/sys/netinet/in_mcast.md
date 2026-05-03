# Component: in_mcast.c

**Path:** `sys/netinet/in_mcast.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_mcast.md`

## Purpose

INET multicast - IPv4 multicast group management.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `in_mcast` | Multicast | `int in_mcast(struct socket *so, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `inet` | IPv4 |
| `multicast` | Group management |

## Includes

- `netinet/in_mcast.h` - Multicast definitions