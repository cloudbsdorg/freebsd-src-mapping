# sys/dev/igb/ — Intel 1GbE Driver Codebase Map

**Path:** `sys/dev/igb/`
**Purpose:** Intel 82575/82576 1GbE driver

## Overview

The igb driver supports Intel 82575/82576 Gigabit Ethernet controllers.

## Key Files

| File | Purpose |
|------|---------|
| `if_igb.c` | Main driver |
| `if_igb_common.c` | Common |
| `igb_common.h` | Common header |
| `igb_osdep.h` | OS dep |

## Supported Devices

| Device | Description |
|--------|-------------|
| 82575GB | 82575 |
| 82576EB | 82576 |

## See Also

- `sys/dev/` - Device drivers