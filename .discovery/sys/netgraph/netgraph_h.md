# Component: netgraph.h

**Path:** `sys/netgraph/netgraph.h`
**Type:** Header
**Maps to:** `.discovery/sys/netgraph/netgraph_h.md`

## Purpose

Netgraph - Graph-based networking subsystem main header.

## Key Definitions

| Item | Purpose |
|------|---------|
| `struct ng_node` | Graph node |
| `struct ng_link` | Connections between nodes |
| `struct ng_mesg` | Control messages |

## Use Cases

| Use | Description |
|-----|-------------|
| `netgraph` | Graph networking |
| `subsystem` | Network subsystem |

## Includes

- `sys/ioccom.h` - IOCTL definitions