# Component: ip_icmp.c

**Path:** `sys/netinet/ip_icmp.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_icmp.md`

## Purpose

IP ICMP - Internet Control Message Protocol.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `icmp_input` | Input | `void icmp_input(struct mbuf *m, ...)` |
| `icmp_error` | Error | `void icmp_error(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `icmp` | ICMP protocol |
| `ping` | Ping/diagnostic |

## Includes

- `netinet/ip_icmp.h` - ICMP definitions