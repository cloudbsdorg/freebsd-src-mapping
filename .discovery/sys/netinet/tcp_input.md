# Component: tcp_input.c

**Path:** `sys/netinet/tcp_input.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_input.md`

## Purpose

TCP input - TCP protocol input processing.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `tcp_input` | Input | `void tcp_input(struct mbuf *m, int off)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `input` | Input processing |

## Includes

- `netinet/tcp_var.h` - TCP variables