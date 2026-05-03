# sys/dev/ata/ — ATA Controller Driver Codebase Map

**Path:** `sys/dev/ata/`
**Purpose:** ATA/IDE controller driver

## Overview

The ata driver supports ATA/IDE controllers and devices.

## Key Files

| File | Purpose |
|------|---------|
| `ata-pci.c` | PCI probe |
| `ata-isa.c` | ISA probe |
| `ata-all.c` | Common code |
| `ata-chipsets.c` | Chip specific |
| `ata-disk.c` | Disk |
| `ata-ATAPI.c` | ATAPI |
| `ata-queue.c` | Command queue |

## ATA Controllers

| Controller | Description |
|-----------|-------------|
| Intel ICH | Intel PIIX, ICH |
| VIA | VIA VT82C686 |
| NVIDIA | NVIDIA nForce |
| AMD | AMD SB600+ |
| SiI | Silicon Image |

## See Also

- `sys/cam/` - CAM SCSI