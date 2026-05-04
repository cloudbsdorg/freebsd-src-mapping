# Component: aac_cam.c

**Path:** `sys/dev/aac/aac_cam.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aac/aac_cam.md`

## Decomposition

#### Includes
```c
#include <cam/cam.h>
#include <cam/cam_ccb.h>
#include <cam/cam_debug.h>
#include <cam/cam_periph.h>
#include <cam/cam_sim.h>
#include <cam/cam_xpt_sim.h>
#include <cam/scsi/scsi_all.h>
#include <cam/scsi/scsi_message.h>
#include <sys/bus.h>
#include <sys/conf.h>
#include <sys/disk.h>
#include <vm/vm.h>
#include <vm/pmap.h>
#include <dev/aac/aacreg.h>
#include <sys/aac_ioctl.h>
#include <dev/aac/aacvar.h>
```

#### Functions
aac_cam_probe, aac_cam_attach, aac_cam_detach, aac_cam_action, aac_cam_poll, aac_cam_complete, aac_cam_rescan, aac_cam_event, aac_cam_reset_bus, aac_cam_abort_ccb, aac_cam_term_io, aac_cam_fix_inquiry

#### Structs
struct aac_cam

## Purpose

CAM (Common Access Method) front-end for AAC RAID controllers. Registers as a CAM SIM (SCSI Interface Module) to handle SCSI passthrough commands for non-DASD devices (tapes, CD-ROMs, etc.).

## Dependencies

- `cam/` - CAM subsystem headers
- `dev/aac/aacvar.h` - AAC softc and command structures