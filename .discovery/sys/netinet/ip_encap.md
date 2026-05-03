# Component: ip_encap.c

**Path:** `sys/netinet/ip_encap.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_encap.md`

## Purpose

IP encapsulation - IP tunnel encapsulation framework.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_encap` | Encapsulate | `int ip_encap(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `encap` | Encapsulation |

## Includes

- `netinet/ip_encap.h` - Encapsulation definitions