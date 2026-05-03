# Component: ip_carp.c

**Path:** `sys/netinet/ip_carp.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_carp.md`

## Purpose

IP CARP - Common Address Redundancy Protocol for HA.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `carp_input` | Input | `void carp_input(struct mbuf *m, ...)` |
| `carp_output` | Output | `int carp_output(struct ifnet *ifp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `carp` | High availability |
| `ha` | Failover |

## Includes

- `netinet/ip_carp.h` - CARP definitions