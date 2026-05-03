# targets/ — Kernel Target Support Codebase Map

**Path:** `targets/`
**Purpose:** Kernel target configurations for virtualization

## Overview

The targets directory contains kernel target support for various virtualization platforms.

## Target Types

| Target | Description |
|--------|-------------|
| `amd64/` | AMD64 virtualization |
| `arm/` | ARM virtualization |
| `i386/` | i386 virtualization |
| `powerpc/` | PowerPC virtualization |

## Virtualization Targets

- `VirtualBox` - Guest additions
- `VMware` - Guest tools
- `Xen` - Paravirtualization
- `Hyper-V` - Microsoft hypervisor

## See Also

- `sys/amd64/` - AMD64 architecture
- `sys/i386/` - i386 architecture
- `sys/xen/` - Xen support