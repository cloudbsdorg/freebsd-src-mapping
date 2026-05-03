# Component: in_prot.c

**Path:** `sys/netinet/in_prot.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_prot.md`

## Purpose

INET protection - socket and PCB visibility/protection.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `cr_canseeinpcb` | Can see | `int cr_canseeinpcb(struct ucred *cred, struct inpcb *inp)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `inet` | IPv4 |
| `protection` | Visibility/protection |

## Includes

- `netinet/in_pcb.h` - PCB definitions