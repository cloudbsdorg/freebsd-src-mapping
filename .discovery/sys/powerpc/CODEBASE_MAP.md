# sys/powerpc/ — PowerPC Architecture Codebase Map

**Path:** `sys/powerpc/`
**Purpose:** PowerPC processor support

## Overview

The powerpc directory contains PowerPC architecture support code.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `powerpc/` | Main PowerPC code |
| `include/` | PowerPC headers |
| `conf/` | PowerPC config |

## Key Files

| File | Purpose |
|------|---------|
| `machdep.c` | Machine setup |
| `trap.c` | Exception handling |
| `pmap.c` | Page table management |

## PowerPC Features

- 32-bit and 64-bit support
- BookE support
- e500mc support
- Cell PPU support

## Key Structures

```c
struct trapframe {
    int     tf_srr0;        // Save/restore reg 0
    int     tf_srr1;        // Save/restore reg 1
    int     tf_excr;        // Exception
    int     tf_dear;        // DEAR
    int     tf_esr;         // ESR
    int     tf_r0;
    int     tf_r1;
    // ... more registers
};
```

## See Also

- `sys/amd64/` - AMD64
- `sys/arm/` - ARM