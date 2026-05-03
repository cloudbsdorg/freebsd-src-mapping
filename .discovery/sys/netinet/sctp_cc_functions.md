# Component: sctp_cc_functions.c

**Path:** `sys/netinet/sctp_cc_functions.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_cc_functions.md`

## Purpose

SCTP congestion control - SCTP CC (Congestion Control) functions.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_enforce_cwnd_limit` | Enforce | `static void sctp_enforce_cwnd_limit(struct sctp_association *asoc, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `congestion` | Congestion control |

## Includes

- `netinet/sctp_cc.h` - CC function definitions