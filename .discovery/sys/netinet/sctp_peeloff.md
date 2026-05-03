# Component: sctp_peeloff.c

**Path:** `sys/netinet/sctp_peeloff.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_peeloff.md`

## Purpose

SCTP peeloff - peel off SCTP associations from listening socket.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_peeloff` | Peel off | `int sctp_peeloff(struct socket *head, sctp_assoc_t id)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `peeloff` | Association peeloff |

## Includes

- `netinet/sctp_peeloff.h` - SCTP peeloff definitions