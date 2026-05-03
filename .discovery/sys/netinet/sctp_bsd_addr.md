# Component: sctp_bsd_addr.c

**Path:** `sys/netinet/sctp_bsd_addr.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_bsd_addr.md`

## Purpose

SCTP BSD address - BSD socket address handling for SCTP.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_bsd_addr` | BSD addr | `void sctp_bsd_addr(struct sctp_inpcb *inp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `address` | Address handling |

## Includes

- `netinet/sctp_bsd_addr.h` - BSD address definitions