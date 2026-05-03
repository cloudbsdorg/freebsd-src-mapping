# Component: if_disc.c

**Path:** `sys/net/if_disc.c`
**Type:** File
**Maps to:** `.discovery/sys/net/if_disc.md`

## Purpose

Discard interface - protocol testing interface that discards all packets.

## Structure

```mermaid
flowchart TD
    A[disc] --> B[disc_input]
    A --> C[disc_output]
    A --> D[disc_ioctl]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `disc_input` | Input | `void disc_input(struct ifnet *ifp, struct mbuf *m)` |
| `disc_output` | Output | `int disc_output(struct ifnet *ifp, struct mbuf *m, ...)` |
| `disc_ioctl` | Ioctl | `int disc_ioctl(struct ifnet *ifp, u_long cmd, caddr_t data)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `testing` | Protocol testing |
| `discard` | Discard packets |

## Includes

- `net/if_clone.h` - Interface cloning