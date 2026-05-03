# sys/dev/em/ — Intel PRO/1000 Ethernet Codebase Map

**Path:** `sys/dev/em/`
**Purpose:** Intel PRO/1000 (8254x/8256x) Ethernet driver

## Overview

The em driver supports Intel PRO/1000 Gigabit Ethernet controllers.

## Key Files

| File | Purpose |
|------|---------|
| `if_em.c` | Main driver |
| `if_em_hw.h` | Hardware |
| `if_em_iq.h` | Registers |

## Supported Devices

| Device | Description |
|--------|-------------|
| 82542 | PRO/1000 Fibernode |
| 82543GC | PRO/1000 T |
| 82544EI | PRO/1000 MT |
| 82545EM | PRO/1000 MT |
| 82546EB | PRO/1000 Quad |
| 82571EB | PRO/1000 PT |
| 82572EI | PRO/1000 PI |
| 82573E | PRO/1000 |
| 82574L | PRO/1000 |

## Features

- MSI/MSI-X
- Interrupt moderation
- TSO
- RSS

## See Also

- `sys/dev/ixgbe/` - Intel 10GbE
- `sys/dev/ixl/` - Intel XL710