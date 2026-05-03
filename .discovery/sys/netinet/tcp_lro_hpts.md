# Component: tcp_lro_hpts.c

**Path:** `sys/netinet/tcp_lro_hpts.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_lro_hpts.md`

## Purpose

TCP LRO HPTS - Large Receive Offload with High Priority Transit.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `tcp_lro_hpts` | HPTS | `int tcp_lro_hpts(struct lro_ctrl *lc, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `lro` | Large Receive Offload |
| `hpts` | High Priority Transit |

## Includes

- `netinet/tcp_lro.h` - LRO definitions