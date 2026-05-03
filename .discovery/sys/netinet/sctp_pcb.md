# Component: sctp_pcb.c

**Path:** `sys/netinet/sctp_pcb.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_pcb.md`

## Purpose

SCTP PCB - Stream Control Transmission Protocol control block management.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_newpcb` | New PCB | `struct sctp_inpcb *sctp_newpcb(struct socket *so, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `pcb` | Protocol control block |

## Includes

- `netinet/sctp_pcb.h` - SCTP PCB definitions