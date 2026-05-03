# Component: accf_http.c

**Path:** `sys/netinet/accf_http.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/accf_http.md`

## Purpose

Accept filter HTTP - accept filter for HTTP request detection.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `accf_http` | HTTP filter | `ACCEPT_FILTER_DEFINE(accf_http, "httpready", ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `accf` | Accept filter |
| `http` | HTTP |

## Includes

- `sys/socketvar.h` - Socket variables