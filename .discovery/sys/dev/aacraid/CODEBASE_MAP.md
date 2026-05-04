# Codebase Map: sys/dev/aacraid

**Path:** `sys/dev/aacraid/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/aacraid/CODEBASE_MAP.md`

## Summary

Driver for Adaptec by PMC-Sierra Series 6, 7, 8, ... families of RAID controllers. Evolved from the older aac driver but with different hardware interface (SRC/SRCv vs i960/StrongARM).

## Components

| File | Purpose |
|------|---------|
| aacraid.c | Main driver core (~3927 lines), PMC SRC interface, command processing |
| aacraid_pci.c | PCI bus interface, device identification, resource allocation |
| aacraid_cam.c | CAM front-end for SCSI passthrough (non-DASD devices) |
| aacraid_linux.c | Linux ioctl compatibility layer |
| aacraid_debug.c | Debugging support |
| aacraid_endian.c | Endian conversion for non-little-endian hosts |
| aacraid_reg.h | Register definitions (~1664 lines) |
| aacraid_var.h | Softc, command, FIB structures (~660 lines) |
| aacraid_debug.h | Debug flags and function declarations |
| aacraid_endian.h | Endian conversion macros |

## Hardware Interfaces

- **AAC_HWIF_SRC** - PMC SRC interface
- **AAC_HWIF_SRCV** - PMC SRCv interface (variant)

## Key Differences from sys/dev/aac

- Newer PMC-Sierra hardware (vs older i960/StrongARM)
- Larger container support (240 vs 64)
- Different mailbox/doorbell register interface
- SRC-specific command submission path

## Dependencies

- `dev/pci/` - PCI bus interface
- `cam/` - CAM subsystem
- `sys/aac_ioctl.h` - User/kernel ioctl interface