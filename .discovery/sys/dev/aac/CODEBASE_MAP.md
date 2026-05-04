# Codebase Map: sys/dev/aac

**Path:** `sys/dev/aac/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/aac/CODEBASE_MAP.md`

## Summary

Adaptec FSA (File System Architecture) family PCI/SCSI RAID adapter driver. Provides disk I/O through CAM layer and management interface through character device.

## Components

| File | Purpose |
|------|---------|
| aac.c | Main driver core, interrupt handling, command threading |
| aac_pci.c | PCI bus interface, device identification, resource allocation |
| aac_disk.c | Block device (disk) interface via generic disk layer |
| aac_cam.c | CAM (Common Access Method) front-end for SCSI passthrough |
| aac_linux.c | Linux ioctl compatibility layer |
| aac_debug.c | Debugging support (queue dumping, FIB printing) |
| aacreg.h | Register definitions, data structure layouts (1563 lines) |
| aacvar.h | Softc, command, FIB, container structures |
| aac_tables.h | Lookup tables for CPU variants, battery platforms, container types |

## Hardware Interfaces

- **AAC_HWIF_I960RX** - Intel i960Rx based adapters
- **AAC_HWIF_STRONGARM** - StrongARM based adapters
- **AAC_HWIF_RKT** - MIPS RISCrocket based adapters
- **AAC_HWIF_NARK** - NARK hardware

## Supported Controllers

- Dell PERC 2/3/4 series
- Adaptec AAC-364, SCSI RAID 2200S/2210S/3230S series
- Adaptec SATA RAID 2410SA/2810SA series
- Adaptec SAS RAID 4005SAS/4805SAS series
- IBM ServeRAID 8i/8s series
- HP NetRaid-4M
- Sun STK RAID controllers
- Many OEM variants

## Key Dependencies

- `dev/pci/` - PCI bus interface
- `cam/` - CAM (Common Access Method) subsystem
- `sys/aac_ioctl.h` - User/kernel ioctl interface
- `vm/pmap.h` - Physical memory mapping