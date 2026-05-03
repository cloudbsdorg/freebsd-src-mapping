# sys/dev/ixl/ — Intel XL710 40GbE Ethernet Codebase Map

**Path:** `sys/dev/ixl/`
**Purpose:** Intel XL710 40GbE driver

## Overview

The ixl driver supports Intel XL710 40 Gigabit Ethernet controllers.

## Key Files

| File | Purpose |
|------|---------|
| `if_ixl.c` | Main driver |
| `if_ixl_common.c` | Common |
| `if_ixl_type.h` | Types |

## Supported Devices

| Device | Description |
|--------|-------------|
| XL710 | 40GbE |
| X710 | 10GbE |
| XXV710 | 25GbE |

## Features

- MSI-X
- SR-IOV
- Flow director
- RSS
- TSO
- VXLAN/NVGRE offload

## See Also

- `sys/dev/ixgbe/` - Intel 10GbE
- `sys/dev/ixlv/` - Intel XL710 VF