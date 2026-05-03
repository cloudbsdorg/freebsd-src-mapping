# sys/amd64/ — AMD64 Architecture Codebase Map

**Path:** `sys/amd64/`
**Files:** Architecture-specific code for AMD64 (x86-64)

## Overview

The amd64 directory contains AMD64 (x86-64) architecture-specific code including the kernel, VMM (hypervisor), ACPI support, and 32-bit compatibility.

## Subdirectories

### Core Kernel (amd64/)

| Directory | Purpose |
|-----------|---------|
| `amd64/` | Main AMD64 kernel code |
| `conf/` | AMD64 kernel configuration |
| `include/` | AMD64 headers |

### Virtual Machine Monitor (vmm/)

| Directory | Purpose |
|-----------|---------|
| `vmm/` | BHyV hypervisor |
| `vmm/io` | VMM I/O handling |

### ACPI Support (acpica/)

| Directory | Purpose |
|-----------|---------|
| `acpica/` | ACPICA interpreter |
| `acpica/include/` | ACPI headers |

### Compatibility (ia32/, linux/, linux32/)

| Directory | Purpose |
|-----------|---------|
| `ia32/` | 32-bit IA-32 support |
| `linux/` | Linux compatibility |
| `linux32/` | 32-bit Linux syscalls |

### Security (sgx/)

| Directory | Purpose |
|-----------|---------|
| `sgx/` | Intel SGX support |

### PCI (pci/)

| Directory | Purpose |
|-----------|---------|
| `pci/` | PCI configuration |

### Page Tables (pt/)

| Directory | Purpose |
|-----------|---------|
| `pt/` | Page table management |

## Core Files (amd64/amd64/)

### Startup & Traps

| File | Purpose |
|------|---------|
| `machdep.c` | Machine-dependent setup |
| `trap.c` | Exception/trap handling |
| `syscall.c` | System call dispatch |
| `ig_machdep.c` | Interrupt generation |

### Memory Management

| File | Purpose |
|------|---------|
| `pmap.c` | Physical map management |
| `uma_machdep.c` | UMA (slab allocator) |
| `memattr.c` | Memory attributes |

### Clock & Time

| File | Purpose |
|------|---------|
| `clock.c` | Clock handling |
| `inittime.c` | Time initialization |

### CPU Management

| File | Purpose |
|------|---------|
| `cpu_mp.c` | Multi-processor support |
| `cpu.c` | CPU management |

### Interrupt Handling

| File | Purpose |
|------|---------|
| `mp_main.c` | AP startup |
| `local_apic.c` | Local APIC |
| `io_apic.c` | IO APIC |
| `icu.c` | Legacy ICU |

## VMM (bhyve Hypervisor)

| File | Purpose |
|------|---------|
| `vmm/vmm.c` | Main VMM |
| `vmm/vmm_iomem.c` | I/O memory |
| `vmm/vmm_mmu.c` | MMU handling |
| `vmm/vmcb.c` | VM control block |
| `vmm/vmx.c` | VMX instructions |
| `vmm/svm.c` | AMD-V (SVM) |

### VMM Structures

```c
struct vm {
    int         vmid;              // VM ID
    struct vcpu *vcpus[MAXCPU];   // Virtual CPUs
    struct pt_entry *pt_root;     // Page table root
    // ... more
};

struct vcpu {
    int         vcpuid;           // Virtual CPU ID
    struct vm *vc_vm;            // Parent VM
    u_long      rax, rbx, rcx, rdx; // Registers
    u_long      rsi, rdi, rbp, rsp;
    u_long      r8-r15;           // Extended registers
    // ... more
};
```

## ACPI (acpica/)

| File | Purpose |
|------|---------|
| `acpica/` | Full ACPICA implementation |

## IA32 Compatibility (ia32/)

| File | Purpose |
|------|---------|
| `ia32/sysvec.c` | IA-32 syscall vector |
| `ia32/ia32_signal.c` | Signal handling |
| `ia32/ptrace32.c` | 32-bit ptrace |

## Linux Compatibility (linux/, linux32/)

| File | Purpose |
|------|---------|
| `linux/linux_sysvec.c` | Linux syscall vector |
| `linux32/linux32_sysvec.c` | 32-bit Linux syscalls |

## Key Structures

### Page Table Entry (AMD64)

```c
// 4-level paging
typedef uint64_t pte_t;
typedef uint64_t *pdentry_t;

// PML4 entry
struct pml4e {
    u_int64_t p      : 1;    // Present
    u_int64_t rw     : 1;    // Read/Write
    u_int64_t us     : 1;    // User/Supervisor
    u_int64_t pwt    : 1;    // Write-through
    u_int64_t pcd    : 1;    // Cache disable
    u_int64_t a      : 1;    // Accessed
    u_int64_t d      : 1;    // Dirty
    u_int64_t pat    : 1;    // PAT
    u_int64_t g      : 1;    // Global
    u_int64_t avl    : 3;    // Available
    u_int64_t phys   : 40;   // Physical address
    u_int64_t avail  : 11;   // Available
    u_int64_t nx     : 1;    // No-execute
};
```

## Registers (AMD64 System)

```c
// System registers
struct cr3 {
    u_int64_t pcid    : 12;   // PCID
    u_int64_t pml4    : 40;   // PML4 base
    u_int64_t reserved : 12;
};

struct gdtr {
    u_int16_t limit;
    u_int64_t base;
};
```

## Syscall Numbers

```c
// AMD64 syscalls (see sys/sys/syscall.h)
#define SYS_exit         1
#define SYS_fork         2
#define SYS_read         3
#define SYS_write        4
#define SYS_open         5
#define SYS_close        6
#define SYS_wait4        7
// ... ~400 syscalls total
```

## Key Dependencies

```c
#include <machine/frame.h>         // Trap frame
#include <machine/pcb.h>          // PCB
#include <machine/pmap.h>         // PMAP
#include <machine/psl.h>          // PSL
#include <machine/trap.h>         // Trap types
```

## See Also

- `sys/x86/` - x86 common code
- `sys/i386/` - i386 architecture
- `sys/vmm/` - BHyV