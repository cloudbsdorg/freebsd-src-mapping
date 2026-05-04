# Component: bhnd.c

**Path:** `sys/dev/bhnd/bhnd.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/bhnd/bhnd_c.md`

## Decomposition

#### Includes
```c
#include <sys/param.h>
#include <sys/kernel.h>
#include <sys/bus.h>
#include <sys/module.h>
#include <sys/sbuf.h>
#include <sys/systm.h>
#include <machine/bus.h>
#include <sys/rman.h>
#include <machine/resource.h>
#include <dev/bhnd/cores/pmu/bhnd_pmu.h>
```

## Purpose

Broadcom HND bus driver. Handles device enumeration, core identification, and resource management for Broadcom networking chipsets.

## Dependencies

- `dev/bhnd/bhndreg.h` - Register definitions
- `dev/bhnd/bhndvar.h` - Structures