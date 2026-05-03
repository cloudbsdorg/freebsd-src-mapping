# Component: ip_reass.c

**Path:** `sys/netinet/ip_reass.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_reass.md`

## Purpose

IP reassembly - Internet Protocol fragment reassembly.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_reass` | Reassemble | `struct mbuf *ip_reass(struct mbuf *m)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `reassembly` | Fragment reassembly |

## Includes

- `netinet/ip_var.h` - IP variables