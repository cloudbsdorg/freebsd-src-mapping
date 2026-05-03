# sys/dev/ixgbe/ — Intel 10GbE Ethernet Codebase Map

**Path:** `sys/dev/ixgbe/`
**Purpose:** Intel 82598/82599/X540/X550 10GbE driver

## Overview

The ixgbe driver supports Intel 10 Gigabit Ethernet controllers.

## Key Files

| File | Purpose |
|------|---------|
| `if_ixgbe.c` | Main driver |
| `if_ixgbe_common.c` | Common |
| `if_ixgbe_82599.c` | 82599 |
| `if_ixgbe_x540.c` | X540 |
| `if_ixgbe_x550.c` | X550 |
| `ixgbe_common.h` | Common header |
| `ixgbe_osdep.h` | OS dep |

## Supported Devices

| Device | Description |
|--------|-------------|
| 82598AF | 10GAF |
| 82599EB | 82599 |
| X540-AT1 | X540 |
| X550-AF | X550 |
| X550EM_A | X550EM |

## Features

- MSI-X
- Flow director
- DCB (Data Center Bridging)
- FCoE
- RSS
- TSO
- VXLAN/GRE offload

## See Also

- `sys/dev/em/` - Intel 1GbE
- `sys/dev/ixl/` - Intel XL710