# Codebase Map: sys/dev/smartpqi

**Path:** `sys/dev/smartpqi/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/smartpqi/CODEBASE_MAP.md`

## Summary

Microsemi SmartPQI (PCIe RAID) driver. Supports SAS/SATA RAID controllers.

## Components

| File | Purpose |
|------|---------|
| smartpqi_main.c | Main driver |
| smartpqi_init.c | Initialization |
| smartpqi_cam.c | CAM interface |
| smartpqi_cmd.c | Command handling |
| smartpqi_request.c | Request processing |
| smartpqi_queue.c | Queue management |
| smartpqi_intr.c | Interrupt handling |
| smartpqi_ioctl.c | Ioctl interface |
| smartpqi_discovery.c | Device discovery |
| smartpqi_event.c | Event handling |

## Dependencies

- `cam/` - CAM subsystem