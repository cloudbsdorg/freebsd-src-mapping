# Component: sctp_module.c

**Path:** `sys/netinet/sctp_module.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_module.md`

## Purpose

SCTP module - SCTP protocol module registration.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_module_load` | Load | `int sctp_module_load(void)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `module` | Module loading |

## Includes

- `netinet/sctp.h` - SCTP definitions