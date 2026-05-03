# Component: accf_tls.c

**Path:** `sys/netinet/accf_tls.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/accf_tls.md`

## Purpose

Accept filter TLS - accept filter for TLS handshake detection.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `accf_tls` | TLS filter | `ACCEPT_FILTER_DEFINE(accf_tls, "tlsready", ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `accf` | Accept filter |
| `tls` | TLS |

## Includes

- `sys/socketvar.h` - Socket variables