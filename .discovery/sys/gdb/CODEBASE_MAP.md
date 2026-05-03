# sys/gdb/ — GDB Remote Debugging Codebase Map

**Path:** `sys/gdb/`
**Purpose:** GDB remote debugging support for kernel

## Overview

The gdb directory provides GDB stub functionality for kernel debugging over serial or network.

## Key Files

| File | Purpose |
|------|---------|
| `gdb_subr.c` | GDB interface |
| `gdb_low.c` | Low-level GDB |

## GDB Protocol

The kernel GDB stub implements the GDB remote protocol:
- Stopped/stubbed state
- Register read/write
- Memory read/write
- Breakpoints
- Single-stepping

## See Also

- `sys/ddb/` - DDB debugger