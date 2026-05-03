# Component: in_jail.c

**Path:** `sys/netinet/in_jail.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_jail.md`

## Purpose

INET jail - jail and network stack integration for IPv4.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `in_jail` | Jail | `int in_jail(struct prison *pr)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `inet` | IPv4 |
| `jail` | Jail integration |

## Includes

- `netinet/in.h` - INET definitions