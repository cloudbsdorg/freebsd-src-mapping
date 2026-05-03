# Component: ip_fastfwd.c

**Path:** `sys/netinet/ip_fastfwd.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_fastfwd.md`

## Purpose

IP fast forwarding - accelerated IP forwarding path.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_fastforward` | Fast forward | `int ip_fastforward(struct mbuf *m)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `forward` | Fast forwarding |

## Includes

- `netinet/ip.h` - IP definitions