# Component: tcp_offload.c

**Path:** `sys/netinet/tcp_offload.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_offload.md`

## Purpose

TCP offload - TCP protocol offloading to TOE devices.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `tcp_offload` | Offload | `int tcp_offload(struct inpcb *inp)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `offload` | Hardware offload |
| `toe` | TCP Offload Engine |

## Includes

- `netinet/tcp_offload.h` - TCP offload definitions