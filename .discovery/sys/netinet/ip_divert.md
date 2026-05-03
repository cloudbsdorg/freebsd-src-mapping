# Component: ip_divert.c

**Path:** `sys/netinet/ip_divert.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_divert.md`

## Purpose

IP divert - divert sockets for IP packet interception.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `divert_input` | Input | `void divert_input(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `divert` | Divert socket |

## Includes

- `netinet/ip_divert.h` - Divert definitions