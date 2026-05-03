# sys/dev/mmc/ — MMC/SD Card Driver Codebase Map

**Path:** `sys/dev/mmc/`
**Purpose:** MultiMediaCard and SD card support

## Overview

The mmc driver provides generic MMC/SD card host support.

## Key Files

| File | Purpose |
|------|---------|
| `mmc.c` | Core |
| `mmc_subr.c` | Subroutines |
| `mmc_bus.h` | Bus |

## Key Structures

```c
struct mmc_host {
    struct mtx lock;
    device_t dev;
    int bus_width;
    int host_ocr;
    uint32_t host_caps;
};
```

## See Also

- `sys/dev/sdhci/` - SDHCI