# tools/ — Build and Utility Tools Codebase Map

**Path:** `tools/`
**Purpose:** Ancillary utilities and build tools

## Overview

The tools directory contains various build and debugging utilities.

## Directory Structure

```
tools/
├── build/              # Build tools
├── debug/              # Debugging tools
├── regression/         # Regression tests
├── boot/               # Boot-related tools
├── coccinelle/        # Coccinelle scripts
└── kerneldoc/         # Kernel documentation
```

## Key Tools

| Tool | Purpose |
|------|---------|
| `install.sh` | Install script |
| `tinder.sh` | Tinderbox build |
| `netmap/` | Netmap testing |

## Coccinelle Scripts

Used for semantic code patches:
```bash
spatch --sp-file tools/coccinelle/linux.cocci ...
```

## See Also

- `release/` - Release build system
- `sys/conf/` - Kernel configuration