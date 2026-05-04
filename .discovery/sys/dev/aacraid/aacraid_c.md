# Component: aacraid.c

**Path:** `sys/dev/aacraid/aacraid.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aacraid/aacraid_c.md`

## Decomposition

#### Includes
```c
#include <sys/param.h>
#include <sys/systm.h>
#include <sys/malloc.h>
#include <sys/kernel.h>
#include <sys/kthread.h>
#include <sys/proc.h>
#include <sys/sysctl.h>
#include <sys/poll.h>
#include <sys/ioccom.h>
#include <sys/bus.h>
#include <sys/conf.h>
#include <sys/rman.h>
#include <machine/bus.h>
#include <machine/resource.h>
#include <dev/pci/pcireg.h>
#include <dev/pci/pcivar.h>
#include <dev/aacraid/aacraid_reg.h>
#include <sys/aac_ioctl.h>
#include <dev/aacraid/aacraid_debug.h>
#include <dev/aacraid/aacraid_var.h>
#include <dev/aacraid/aacraid_endian.h>
```

#### Functions
aac_add_container, aac_get_bus_info, aac_container_bus, aac_daemon, aac_convert_sgraw2, aac_timeout, aac_command_thread, aac_sync_fib, aac_map_command_helper, aac_alloc_commands, aac_free_commands, aac_unmap_command, aac_alloc, aac_common_map, aac_check_firmware, aac_define_int_mode, aac_init, aac_find_pci_capability, aac_setup_intr, aac_check_config, aac_src_get_fwstatus, aac_src_qnotify, aac_src_get_istatus, aac_src_clear_istatus, aac_src_set_mailbox, aac_src_get_mailbox, aac_src_access_devreg, aac_src_send_command, aac_src_get_outb_queue, aac_src_set_outb_queue, aac_srcv_set_mailbox, aac_srcv_get_mailbox

#### Interfaces
aacraid_src_interface, aacraid_srcv_interface

## Purpose

Main driver for PMC-Sierra RAID controllers. Handles command processing, firmware interaction, and interrupt management via SRC/SRCv interfaces.

## Dependencies

- `dev/aacraid/aacraid_reg.h` - Register definitions
- `dev/aacraid/aacraid_var.h` - Softc structures
- `dev/aacraid/aacraid_endian.h` - Endian conversion