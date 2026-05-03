# Component: sctp_timer.c

**Path:** `sys/netinet/sctp_timer.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_timer.md`

## Purpose

SCTP timer - Stream Control Transmission Protocol timer management.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_timer` | Timer | `void sctp_timer(struct sctp_inpcb *inp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `timer` | Timer management |

## Includes

- `netinet/sctp_timer.h` - SCTP timer definitions