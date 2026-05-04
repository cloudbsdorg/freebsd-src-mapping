# Component: aac_pci.c

**Path:** `sys/dev/aac/aac_pci.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aac/aac_pci.md`

## Decomposition

#### Includes
```c
#include <sys/param.h>
#include <sys/systm.h>
#include <sys/kernel.h>
#include <sys/module.h>
#include <sys/bio.h>
#include <sys/bus.h>
#include <sys/conf.h>
#include <sys/disk.h>
#include <machine/bus.h>
#include <machine/resource.h>
#include <sys/rman.h>
#include <dev/pci/pcireg.h>
#include <dev/pci/pcivar.h>
#include <dev/aac/aacreg.h>
#include <sys/aac_ioctl.h>
#include <dev/aac/aacvar.h>
```

#### Functions
aac_pci_probe, aac_pci_attach, aac_find_ident, aacch_probe, aacch_attach, aacch_detach

#### Global Variables
aac_enable_msi, aac_identifiers[], aac_family_identifiers[]

## Purpose

PCI bus interface for Adaptec FSA RAID controllers. Handles device identification via vendor/device IDs, resource allocation (memory regions, IRQs), and hardware interface selection (i960RX, StrongARM, Rocket/MIPS).

## Dependencies

- `dev/aac/aacreg.h` - AAC register definitions
- `dev/aac/aacvar.h` - AAC softc structure
- `dev/pci/` - PCI bus access