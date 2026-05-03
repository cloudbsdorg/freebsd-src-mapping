# sys/isa/ — ISA Bus Codebase Map

**Path:** `sys/isa/`
**Purpose:** Industry Standard Architecture bus support

## Overview

The isa directory contains ISA bus support for x86 systems.

## Key Files

| File | Purpose |
|------|---------|
| `isa.c` | ISA bus management |
| `isa_device.h` | ISA device structure |

## ISA Resource Types

```c
// ISA port ranges
#define ISA_PORT_TYPE      1
// ISA memory ranges
#define ISA_MEM_TYPE       2
// ISA IRQ lines
#define ISA_IRQ_TYPE       3
// ISA DRQ channels
#define ISA_DRQ_TYPE       4
```

## See Also

- `sys/x86/` - x86 shared code
- `sys/i386/` - i386 architecture