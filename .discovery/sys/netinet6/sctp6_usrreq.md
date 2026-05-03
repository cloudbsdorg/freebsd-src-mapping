# Component: sctp6_usrreq.c

**Path:** `sys/netinet6/sctp6_usrreq.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet6/sctp6_usrreq.md`

## Purpose

SCTPv6 user requests - SCTP protocol user request handlers for IPv6.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp6_input` | Input | `int sctp6_input(struct mbuf **i_pak, int *offp, uint16_t port)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `ipv6` | IPv6 |

## Includes

- `netinet6/sctp6_var.h` - SCTP6 definitions