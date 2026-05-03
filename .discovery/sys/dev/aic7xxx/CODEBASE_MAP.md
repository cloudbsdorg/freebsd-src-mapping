# sys/dev/aic7xxx/ — Adaptec AIC7xxx SCSI Codebase Map

**Path:** `sys/dev/aic7xxx/`
**Purpose:** Adaptec AIC7xxx SCSI controller driver

## Overview

The aic7xxx driver supports Adaptec AIC7xxx SCSI controllers.

## Key Files

| File | Purpose |
|------|---------|
| `aic7xxx.c` | Main driver |
| `aic7xxx_pci.c` | PCI probe |
| `aic7xxx_reg.h` | Registers |
| `aic7xxx_seq.c` | Sequencer |

## Driver Features

- SCSI-3 support
- Ultra320 support
- Tagged queuing
- Scatter-gather

## See Also

- `sys/cam/` - CAM SCSI subsystem