# Component: in_pcb.c

**Path:** `sys/netinet/in_pcb.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_pcb.md`

## Purpose

INET PCB - Internet Protocol control block management.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `in_pcbbind` | Bind | `int in_pcbbind(struct inpcb *inp, ...)` |
| `in_pcbconnect` | Connect | `int in_pcbconnect(struct inpcb *inp, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `inet` | IPv4 |
| `pcb` | Protocol control block |

## Includes

- `netinet/in_pcb.h` - PCB definitions