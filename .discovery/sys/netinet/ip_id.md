# Component: ip_id.c

**Path:** `sys/netinet/ip_id.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_id.md`

## Purpose

IP ID generation - IP identification field generation.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_id` | Generate ID | `uint16_t ip_id(struct mbuf *m)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `id` | Fragment ID |

## Includes

- `netinet/ip.h` - IP definitions