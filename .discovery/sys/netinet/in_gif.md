# Component: in_gif.c

**Path:** `sys/netinet/in_gif.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_gif.md`

## Purpose

GIF tunnel - Generic Tunnel Interface for IPv4/IPv6 tunneling.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `gif_input` | Input | `void gif_input(struct mbuf *m, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `gif` | Generic tunnel |
| `tunnel` | Tunnel interface |

## Includes

- `netinet/ip_gre.h` - GIF definitions