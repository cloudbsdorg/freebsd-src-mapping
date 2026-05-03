# Component: tcp_ecn.c

**Path:** `sys/netinet/tcp_ecn.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_ecn.md`

## Purpose

TCP ECN - Explicit Congestion Notification for TCP.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `tcp_ecn` | ECN | `void tcp_ecn(struct tcpcb *tp)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `ecn` | Explicit Congestion Notification |

## Includes

- `netinet/tcp_var.h` - TCP variables