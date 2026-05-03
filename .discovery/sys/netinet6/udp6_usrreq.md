# Component: udp6_usrreq.c

**Path:** `sys/netinet6/udp6_usrreq.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/udp6_usrreq.md`

## Purpose

UDPv6 user requests - UDP protocol user request handlers for IPv6.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `udp6_input` | Input | `void udp6_input(struct mbuf *m, int off)` |
| `udp6_output` | Output | `int udp6_output(struct in6pcb *inp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `udp` | UDP protocol |
| `ipv6` | IPv6 |

## Includes

- `netinet6/udp6.h` - UDP6 definitions