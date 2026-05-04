# Component: aacraid_pci.c

**Path:** `sys/dev/aacraid/aacraid_pci.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aacraid/aacraid_pci.md`

## Decomposition

#### Functions
aacraid_pci_probe, aacraid_pci_attach

#### Global Variables
aacraid_family_identifiers[]

## Purpose

PCI bus interface for PMC-Sierra RAID controllers. Handles device identification and resource allocation.

## Dependencies

- `dev/aacraid/aacraid_reg.h` - Register definitions
- `dev/aacraid/aacraid_var.h` - Softc structures