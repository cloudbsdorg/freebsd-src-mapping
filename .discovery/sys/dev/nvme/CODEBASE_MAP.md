# sys/dev/nvme/ — NVMe Driver Codebase Map

**Path:** `sys/dev/nvme/`
**Purpose:** NVM Express (NVMe) driver

## Overview

The nvme driver supports NVMe storage devices.

## Key Files

| File | Purpose |
|------|---------|
| `nvme.c` | Main |
| `nvme_private.h` | Private |
| `nvme_sysctl.c` | Sysctl |
| `nvme_compat.c` | Compat |

## Features

- NVMe 1.0+
- Multiple namespaces
- Admin + I/O queues
- SGL support

## See Also

- `sys/dev/ata/` - SATA/AHCI
- `sys/geom/raid3/` - GEOM