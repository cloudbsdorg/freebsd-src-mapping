# sys/cam/ — CAM SCSI Subsystem Codebase Map

**Path:** `sys/cam/`
**Files:** 7 C source files (plus subdirectories)
**Purpose:** Common Access Method for SCSI/ATA storage devices

## Overview

CAM provides a unified interface for SCSI and ATA storage devices. It consists of XPT (transport layer), SIM (SCSI Interface Module), and peripheral drivers.

## Core Files

| File | Purpose |
|------|---------|
| `cam.c` | CAM initialization |
| `cam_xpt.c` | XPT (SCSI Transport) |
| `cam_sim.c` | SIM (SCSI Interface Module) |
| `cam_periph.c` | Peripheral drivers |
| `cam_queue.c` | Queue management |
| `cam_iosched.c` | I/O scheduler |
| `cam_compat.c` | Compatibility |

## Architecture

```
┌─────────────────────────────────────┐
│      Peripheral Drivers              │
│  (da, cd, pass, tape, etc.)         │
└─────────────────────────────────────┘
              │ CCB
              ▼
┌─────────────────────────────────────┐
│     XPT (SCSI Transport Layer)       │
│    (cam_xpt.c)                      │
└─────────────────────────────────────┘
              │ CCB
              ▼
┌─────────────────────────────────────┐
│     SIM (SCSI Interface Module)       │
│  (ahci, mrsas, isp, etc.)           │
└─────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│       Hardware (HBA)                 │
│   (SATA, SAS, FC, USB Storage)       │
└─────────────────────────────────────┘
```

## CCB (CAM Control Block)

```c
struct ccb_hdr {
    u_int32_t      ccb_hrsvd;       // Reserved
    u_int16_t      ccb_hfunc;       // Function
    u_int16_t      ccb_hstatus;     // Status
    u_int32_t      ccb_hflags;      // Flags
    struct ccb_pathid ccb_xport_id; // Transport ID
    struct ccb_targetid ccb_tgt_id; // Target ID
    struct ccb_lun    ccb_lun;      // LUN
    u_int64_t      ccb_hob;         // High-order bit
};

struct ccb_scsiio {
    struct ccb_hdr    ccb_h;
    u_int8_t          *cdb_io;
    struct scsi_sense_data *sense_data;
    // ... many more fields
};
```

### XPT Functions

```c
// Path/system operations
XPT_PATH_INQ         // Path inquiry
XPT_GET_CHAN_PATHS   // Get paths
XPT_RESET_BUS        // Reset bus
XPT_RESET_DEV        // Reset device
XPT_SCAN_BUS         // Scan bus

// SCSI operations
XPT_SCSI_IO          // Execute SCSI I/O
XPT_CONT_TARGET      // Continue target mode
XPT_TERM_IO          // Terminate I/O

// ATA operations
XPT_ATA_IO           // Execute ATA I/O
```

## SIM (SCSI Interface Module)

```c
// SIM registration
struct cam_sim *cam_sim_alloc(sim_action, sim_poll, const char *name);
void cam_sim_free(struct cam_sim *sim);

// SIM operations
typedef void (*sim_action)(struct cam_sim *);
typedef void (*sim_poll)(struct cam_section *);

// SIM functions provided to XPT
struct simsi {
    int  (*sim_strategy)(struct bio *bp);
    void (*simmin_timeout)(struct cam_sim *);
    int  (*sim_match)(struct ccb_setmatch *ccb);
    int  (*sim_poll)(struct cam_sim *);
};
```

## Peripheral Drivers

```c
// cam_periph.c - Peripheral driver framework
struct periph_driver {
    const char *driver_name;
    TAILQ_HEAD(, cam_periph) units;
    periph_init_t *init;
    periph_start_t *start;
    int    references;
};

// Example: da (disk) driver
struct disk {
    struct cam_periph *periph;
    struct bio_queue_head bio_queue;
    // ...
};
```

## Queue Management

```c
// cam_queue.c - Queue operations
struct camq {
    u_int32_t      array_size;      // Array size
    u_int32_t      entries;         // Current entries
    u_int32_t      openings;        // Available slots
    struct camq_entry **queue;      // Queue array
    struct mtx     lock;            // Lock
};

// CAM queue callbacks
typedef void (*cam_status_action)(u_int32_t status, u_int8_t *actions);
```

## I/O Scheduler

```c
// cam_iosched.c - I/O scheduling
struct cam_iosched_softc {
    struct mtx         lock;
    struct camq        queue;
    struct bio         *current_bio;
    int                busy;
    // ... scheduling state
};

// Scheduler operations
cam_iosched_init()
cam_iosched_queue()
cam_iosched_start()
cam_iosched_done()
```

## ATA Submodule (ata/)

| File | Purpose |
|------|---------|
| `ata_da.c` | ATA disk |
| `ata_atapicd.c` | ATA CD-ROM |
| `ata-*.c` | Various ATA controllers |

## Initialization

```c
// cam.c
static int
cam_modevent(module_t mod, int type, char **name, void *arg)
{
    switch (type) {
    case MOD_LOAD:
        cam_init();
        xpt_init();
        break;
    case MOD_UNLOAD:
        xpt_fini();
        cam_fini();
        break;
    }
}
```

## CAM Status Codes

```c
#define CAM_REQ_CMP       0x00    // Request completed OK
#define CAM_REQ_CMP_ERR   0x01    // Request completed with error
#define CAM_REQ_INPROG    0x02    // Request in progress
#define CAM_REQ_VOEPP     0x03    // Valid OEOB
#define CAM_CMD_TIMEOUT   0x04    // Command timeout
#define CAM_RESelect      0x05    // Bus reselected
#define CAM_SCSI_BUSY     0x06    // Bus busy
#define CAM_NO_NEXUS      0x07    // No nexus
#define CAM_DEV_NOT_THERE 0x16   // Device not found
```

## Device Names

| Driver | Device | Description |
|--------|--------|-------------|
| `da` | /dev/da* | Direct Access (disk) |
| `cd` | /dev/cd* | CD-ROM |
| `pass` | /dev/pass* | Pass-through |
| `tape` | /dev/{,n}sa* | Sequential access (tape) |
| `ch` | /dev/ch* | Changer |

## Key Dependencies

```c
#include <cam/cam.h>               // Main header
#include <cam/cam_ccb.h>           // CCB
#include <cam/cam_xpt.h>           // XPT
#include <cam/cam_sim.h>           // SIM
#include <cam/cam_periph.h>        // Peripheral
#include <cam/cam_queue.h>         // Queue
```

## See Also

- `sys/dev/ata/` - ATA drivers
- `sys/dev/mrsas/` - LSI MegaRAID
- `sys/dev/isp/` - QLogic Fibre Channel
- `sys/geom/geom_disk.c` - GEOM disk