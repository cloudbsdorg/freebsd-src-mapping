# sys/dev/ahci/ — AHCI Controller Driver Codebase Map

**Path:** `sys/dev/ahci/`
**Purpose:** AHCI (Advanced Host Controller Interface)

## Overview

The ahci driver supports AHCI SATA controllers.

## Key Files

| File | Purpose |
|------|---------|
| `ahci.c` | Main |
| `ahciem.c` | Enclosure |
| `ahcivar.h` | Variables |

## Features

- SATA 1.5/3/6 Gbps
- Port multipliers
- FIS-based switching
- NCQ (Native Command Queuing)

## See Also

- `sys/dev/ata/` - ATA/IDE