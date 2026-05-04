# Codebase Map: sys/dev/ufshci

**Path:** `sys/dev/ufshci/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/ufshci/CODEBASE_MAP.md`

## Summary

Universal Flash Storage (UFS) host controller driver. Supports UFS storage devices via SCSI CAM interface.

## Components

| File | Purpose |
|------|---------|
| ufshci.c | Main UFSHCI driver |
| ufshci_ctrlr.c | Controller management |
| ufshci_ctrlr_cmd.c | Controller commands |
| ufshci_req_queue.c | Request queue |
| ufshci_uic_cmd.c | UIC (Unified Protocol) commands |
| ufshci_pci.c | PCI bus support |
| ufshci_acpi.c | ACPI support |

## Dependencies

- `cam/` - CAM subsystem