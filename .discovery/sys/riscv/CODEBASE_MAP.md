# sys/riscv/ — RISC-V Architecture Codebase Map

**Path:** `sys/riscv/`
**Purpose:** RISC-V processor support

## Overview

The riscv directory contains RISC-V architecture support code.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `riscv/` | Main RISC-V code |
| `include/` | RISC-V headers |
| `conf/` | RISC-V config |

## Key Files

| File | Purpose |
|------|---------|
| `machdep.c` | Machine setup |
| `trap.c` | Exception handling |
| `pmap.c` | Page table management |

## RISC-V Features

- RV64GC support
- Sv39 virtual memory
- SBI (Supervisor Binary Interface)
- CLint for timer/interrupt

## Key Structures

```c
struct trapframe {
    register_t tf_sepc;     // Exception PC
    register_t tf_sstatus;  // Status
    register_t tf_stval;    // Trap value
    register_t tf_scause;   // Cause
    register_t tf_ra;       // Return address
    register_t tf_sp;       // Stack pointer
    register_t tf_gp;       // Global pointer
    register_t tf_tp;       // Thread pointer
    register_t tf_t0;
    // ... more registers
};
```

## See Also

- `sys/amd64/` - AMD64
- `sys/arm64/` - ARM64