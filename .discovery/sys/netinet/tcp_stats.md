# Component: tcp_stats.c

**Path:** `sys/netinet/tcp_stats.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_stats.md`

## Purpose

TCP statistics - TCP protocol statistics collection.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `tcp_stats` | Stats | `void tcp_stats(struct tcpstat *sp)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `stats` | Statistics |

## Includes

- `netinet/tcp_var.h` - TCP variables