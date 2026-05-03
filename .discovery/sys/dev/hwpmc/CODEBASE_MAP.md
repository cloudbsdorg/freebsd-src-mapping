# sys/dev/hwpmc/ — Hardware Performance Monitor Codebase Map

**Path:** `sys/dev/hwpmc/`
**Purpose:** CPU performance monitoring counters

## Overview

The hwpmc driver provides access to CPU performance monitoring counters.

## Key Files

| File | Purpose |
|------|---------|
| `hwpmc.c` | Main |
| `hwpmc_amd.c` | AMD |
| `hwpmc_arm.c` | ARM |
| `hwpmc_core.c` | Core |
| `hwpmc_intel.c` | Intel |
| `hwpmc_mips.c` | MIPS |
| `hwpmc_ppc.c` | PowerPC |

## See Also

- `usr.sbin/pmcstat/` - PMC stats