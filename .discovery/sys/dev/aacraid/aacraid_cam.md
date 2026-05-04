# Component: aacraid_cam.c

**Path:** `sys/dev/aacraid/aacraid_cam.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aacraid/aacraid_cam.md`

## Decomposition

#### Structs
struct aac_cam

## Purpose

CAM front-end for PMC-Sierra RAID controllers. Registers as CAM SIM for SCSI passthrough to non-DASD devices.

## Dependencies

- `cam/` - CAM subsystem
- `dev/aacraid/aacraid_reg.h` - Register definitions
- `dev/aacraid/aacraid_var.h` - Softc structures