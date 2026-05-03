# sys/i386/ — i386 Architecture Codebase Map

**Path:** `sys/i386/`
**Purpose:** Intel i386 (32-bit x86) processor support

## Overview

The i386 directory contains code for 32-bit Intel x86 processors.

## Directory Structure

```
i386/
├── i386/           # Main i386 code
├── conf/           # i386 kernel config
├── include/        # i386 headers
└── ia32/          # IA-32 compatibility
```

## Key Files

| File | Purpose |
|------|---------|
| `i386/machdep.c` | Machine-dependent setup |
| `i386/trap.c` | Exception handling |
| `i386/pmap.c` | Page table management |

## Key Structures

```c
// i386 trapframe
struct trapframe {
    int     tf_fs;
    int     tf_es;
    int     tf_ds;
    int     tf_edi;
    int     tf_esi;
    int     tf_ebp;
    int     tf_isp;
    int     tf_ebx;
    int     tf_edx;
    int     tf_ecx;
    int     tf_eax;
    int     tf_trapno;
    int     tf_err;
    int     tf_eip;
    int     tf_cs;
    int     tf_eflags;
    int     tf_esp;
    int     tf_ss;
};
```

## See Also

- `sys/amd64/` - AMD64 (64-bit)
- `sys/x86/` - Shared x86 code