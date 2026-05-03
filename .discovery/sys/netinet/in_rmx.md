# Component: in_rmx.c

**Path:** `sys/netinet/in_rmx.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_rmx.md`

## Purpose

INET routing multiplex - routing table operations for IPv4.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `rib4_set_nh_pfxflags` | Set nexthop | `int rib4_set_nh_pfxflags(u_int fibnum, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `routing` | IPv4 routing |
| `rib` | Routing information base |

## Includes

- `netinet/in_rmx.h` - Route multiplex definitions