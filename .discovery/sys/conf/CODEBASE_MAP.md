# sys/conf/ — Kernel Configuration Codebase Map

**Path:** `sys/conf/`
**Purpose:** Kernel build configuration

## Overview

The conf directory contains kernel build files, device lists, and configuration.

## Key Files

| File | Purpose |
|------|---------|
| `files` | Device file list |
| `files.*` | Architecture-specific files |
| `kern.pre.mk` | Pre-build kernel makefile |
| `kern.post.mk` | Post-build kernel makefile |
| `kern.mk` | Main kernel makefile |
| `options` | Kernel options |

## Device Configuration

```
# files format
device <name>   <source_file.c>    [optional flags]
```

## Kernel Options

```
options KDB                 # Kernel debugger
options DDB                 # DDB debugger
options INVARIANTS          # Debugging checks
options INVARIANT_SUPPORT    # Support for invariants
```

## See Also

- `sys/kern/` - Kernel source
- `sys/modules/` - Loadable modules