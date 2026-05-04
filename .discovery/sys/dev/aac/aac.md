# Component: aac.c

**Path:** `sys/dev/aac/aac.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aac/aac.md`

## Decomposition

#### Includes
```c
#include <sys/cdefs.h>
#include <sys/param.h>
#include <sys/systm.h>
#include <sys/malloc.h>
#include <sys/kernel.h>
#include <sys/kthread.h>
#include <sys/proc.h>
#include <sys/sysctl.h>
#include <sys/sysent.h>
#include <sys/poll.h>
#include <sys/ioccom.h>
#include <sys/bus.h>
#include <sys/conf.h>
#include <sys/signalvar.h>
#include <sys/time.h>
#include <sys/eventhandler.h>
#include <sys/rman.h>
#include <machine/bus.h>
#include <machine/resource.h>
#include <dev/pci/pcireg.h>
#include <dev/pci/pcivar.h>
#include <dev/aac/aacreg.h>
#include <sys/aac_ioctl.h>
#include <dev/aac/aacvar.h>
#include <dev/aac/aac_tables.h>
```

#### Functions
aac_attach, aac_free, aac_detach, aac_shutdown, aac_suspend, aac_resume, aac_new_intr, aac_filter, aac_startio, aac_command_thread, aac_complete, aac_submit_bio, aac_bio_command, aac_bio_complete, aac_wait_command, aac_alloc_command, aac_release_command, aac_alloc_commands, aac_free_commands, aac_map_command_sg, aac_unmap_command, aac_check_firmware, aac_init, aac_sync_command, aac_setup_intr, aac_enqueue_fib, aac_dequeue_fib, aac_enqueue_response, aac_startup, aac_add_container, aac_get_bus_info, aac_daemon, aac_get_container_info

#### Interfaces
aac_sa_interface, aac_rx_interface, aac_rkt_interface

## Purpose

Adaptec FSA (File System Architecture) family PCI/SCSI RAID adapter driver. Provides disk I/O through CAM layer and management interface through character device.

## Dependencies

- `dev/aac/aacreg.h` - AAC register definitions
- `dev/aac/aacvar.h` - AAC softc and command structures
- `dev/aac/aac_tables.h` - AAC tables