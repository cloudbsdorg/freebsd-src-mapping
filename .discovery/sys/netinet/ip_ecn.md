# Component: ip_ecn.c

**Path:** `sys/netinet/ip_ecn.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/ip_ecn.md`

## Purpose

IP ECN - Explicit Congestion Notification for IP.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `ip_ecn` | ECN | `void ip_ecn(struct mbuf *m)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `ip` | IP protocol |
| `ecn` | ECN |

## Includes

- `netinet/ip_ecn.h` - ECN definitions