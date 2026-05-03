# Component: sctp_auth.c

**Path:** `sys/netinet/sctp_auth.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_auth.md`

## Purpose

SCTP auth - Stream Control Transmission Protocol authentication.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_auth_chklist` | Auth check | `sctp_auth_chklist_t *sctp_alloc_chunklist(void)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `auth` | Authentication |

## Includes

- `netinet/sctp_auth.h` - SCTP auth definitions