# sys/dev/bge/ — Broadcom Gigabit Ethernet Codebase Map

**Path:** `sys/dev/bge/`
**Purpose:** Broadcom Tigon3 Gigabit Ethernet driver

## Overview

The bge driver supports Broadcom Tigon3 Gigabit Ethernet controllers.

## Key Files

| File | Purpose |
|------|---------|
| `if_bge.c` | Main driver |
| `if_bgereg.h` | Registers |
| `if_bge_chip.c` | Chip ops |

## Supported Chips

| Chip | Description |
|------|-------------|
| BCM5700 | Tigon 3 |
| BCM5701 | Tigon 3 |
| BCM5702 | Tigon 3 |
| BCM5703 | Tigon 3 |
| BCM5704 | Tigon 3 |
| BCM5705 | Tigon 3 |
| BCM5750 | Tigon 3 |

## Features

- Jumbo frames
- TCP segmentation offload
- IP checksum offload
- VLAN tag stripping

## See Also

- `sys/net/ ` - Network stack