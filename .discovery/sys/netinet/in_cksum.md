# Component: in_cksum.c

**Path:** `sys/netinet/in_cksum.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_cksum.md`

## Purpose

INET checksum - Internet Protocol checksum implementations.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `in_cksum` | Checksum | `int in_cksum(struct mbuf *m, int len)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `inet` | IPv4 |
| `checksum` | Checksum calculation |

## Includes

- `netinet/in.h` - INET definitions