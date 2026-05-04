# Component: aac_disk.c

**Path:** `sys/dev/aac/aac_disk.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aac/aac_disk.md`

## Decomposition

#### Includes
```c
#include <sys/param.h>
#include <sys/systm.h>
#include <sys/kernel.h>
#include <sys/module.h>
#include <sys/bus.h>
#include <sys/conf.h>
#include <sys/disk.h>
#include <vm/vm.h>
#include <vm/pmap.h>
#include <machine/md_var.h>
#include <machine/bus.h>
#include <sys/rman.h>
#include <dev/aac/aacreg.h>
#include <sys/aac_ioctl.h>
#include <dev/aac/aacvar.h>
```

#### Functions
aac_disk_open, aac_disk_close, aac_disk_strategy, aac_disk_dump, aac_disk_probe, aac_disk_attach, aac_disk_detach, aac_biodone, aac_dump_map_sg, aac_dump_map_sg64

## Purpose

Block device interface for AAC RAID containers. Provides standard disk I/O through the CAM/genhd layer. Handles geometry calculation, bio submission, and crash dump writing.

## Dependencies

- `sys/disk.h` - Generic disk layer
- `dev/aac/aacreg.h` - AAC register definitions
- `dev/aac/aacvar.h` - AAC disk and softc structures