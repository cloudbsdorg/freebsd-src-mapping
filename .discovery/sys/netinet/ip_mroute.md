# Component: ip_mroute.c

**Path:** `sys/netinet/ip_mroute.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_mroute.md`

## Purpose

IP multicast routing - multicast routing daemon and forwarding.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_mroute` | Multicast | `void ip_mroute(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `multicast` | Multicast routing |

## Includes

- `netinet/ip_mroute.h` - Multicast routing definitions