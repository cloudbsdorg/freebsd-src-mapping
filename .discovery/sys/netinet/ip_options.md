# Component: ip_options.c

**Path:** `sys/netinet/ip_options.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_options.md`

## Purpose

IP options - Internet Protocol options processing.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_options` | Options | `void ip_options(struct mbuf *m)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `options` | IP options |

## Includes

- `netinet/ip_var.h` - IP variables