# Component: raw_ip.c

**Path:** `sys/netinet/raw_ip.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/raw_ip.md`

## Purpose

Raw IP - raw socket protocol for IP.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `rip_input` | Input | `void rip_input(struct mbuf *m, int off)` |
| `rip_output` | Output | `int rip_output(struct socket *so, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `raw` | Raw socket |
| `ip` | IP protocol |

## Includes

- `netinet/raw_ip.h` - Raw IP definitions