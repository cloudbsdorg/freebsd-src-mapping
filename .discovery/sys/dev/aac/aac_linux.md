# Component: aac_linux.c

**Path:** `sys/dev/aac/aac_linux.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aac/aac_linux.md`

## Decomposition

#### Includes
```c
#include <sys/param.h>
#include <sys/systm.h>
#include <sys/capsicum.h>
#include <sys/conf.h>
#include <sys/kernel.h>
#include <sys/module.h>
#include <sys/file.h>
#include <sys/proc.h>
#include <machine/../linux32/linux.h>
#include <machine/../linux32/linux32_proto.h>
#include <compat/linux/linux_ioctl.h>
```

#### Functions
aac_linux_modevent, aac_linux_ioctl

## Purpose

Linux ioctl compatibility layer. Passes through Linux-style ioctl commands to the standard AAC ioctl handler for binary compatibility with Linux tools.

## Dependencies

- `compat/linux/` - Linux emulation layer