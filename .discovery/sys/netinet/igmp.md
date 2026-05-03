# Component: igmp.c

**Path:** `sys/netinet/igmp.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/igmp.md`

## Purpose

IGMP - Internet Group Management Protocol for multicast group management.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `igmp_input` | Input | `void igmp_input(struct mbuf *m, ...)` |
| `igmp_joingroup` | Join | `int igmp_joingroup(struct ifnet *ifp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `igmp` | Group management |
| `multicast` | Multicast |

## Includes

- `netinet/igmp.h` - IGMP definitions