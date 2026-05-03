# Component: ip_gre.c

**Path:** `sys/netinet/ip_gre.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_gre.md`

## Purpose

IP GRE - Generic Routing Encapsulation over IP.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `gre_input` | Input | `void gre_input(struct mbuf *m, ...)` |
| `gre_output` | Output | `int gre_output(struct ifnet *ifp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `gre` | GRE tunneling |

## Includes

- `netinet/ip_gre.h` - GRE definitions