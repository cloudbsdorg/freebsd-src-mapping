# Component: sctp_usrreq.c

**Path:** `sys/netinet/sctp_usrreq.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_usrreq.md`

## Purpose

SCTP user requests - SCTP protocol user request handlers.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_usrreq` | User req | `int sctp_usrreq(struct socket *so, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `socket` | Socket operations |

## Includes

- `netinet/sctp_var.h` - SCTP variables