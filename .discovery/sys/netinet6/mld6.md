# Component: mld6.c

**Path:** `sys/netinet6/mld6.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/mld6.md`

## Purpose

MLDv6 - Multicast Listener Discovery for IPv6.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `mld6_input` | Input | `void mld6_input(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `mld` | Multicast Listener Discovery |

## Includes

- `netinet6/mld6.h` - MLD definitions