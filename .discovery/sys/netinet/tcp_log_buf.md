# Component: tcp_log_buf.c

**Path:** `sys/netinet/tcp_log_buf.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_log_buf.md`

## Purpose

TCP log buffer - TCP logging buffer for debugging.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `tcp_log_buf` | Log buffer | `void tcp_log_buf(struct tcpcb *tp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `logging` | Debug logging |

## Includes

- `netinet/tcp_log_buf.h` - TCP log buffer definitions