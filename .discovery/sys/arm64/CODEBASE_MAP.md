# sys/arm64/ — ARM64 (AArch64) Architecture Codebase Map

**Path:** `sys/arm64/`
**Purpose:** ARM64 (AArch64) processor support

## Overview

The arm64 directory contains code for 64-bit ARM processors used in servers (Apple Silicon, AWS Graviton, Ampere) and mobile devices.

## Subarchitectures

### Apple Silicon

| Directory | Description |
|-----------|-------------|
| `apple/` | Apple M1, M2, M3 |

### ARM Reference

| Directory | Description |
|-----------|-------------|
| `arm64/` | Generic ARM64 |

### Broadcom

| Directory | Description |
|-----------|-------------|
| `broadcom/` | Broadcom Storm |

### Cavium

| Directory | Description |
|-----------|-------------|
| `cavium/` | Cavium ThunderX |

### CoreSight (Debug)

| Directory | Description |
|-----------|-------------|
| `coresight/` | ARM CoreSight debug |

### Freescale/NXP

| Directory | Description |
|-----------|-------------|
| `freescale/` | NXP Layerscape |

### Intel

| Directory | Description |
|-----------|-------------|
| `intel/` | Intel (some mobile) |

### NVIDIA

| Directory | Description |
|-----------|-------------|
| `nvidia/` | NVIDIA Carmel |

### NXP QorIQ

| Directory | Description |
|-----------|-------------|
| `qoriq/` | NXP QorIQ |

### Rockchip

| Directory | Description |
|-----------|-------------|
| `rockchip/` | Rockchip RK3399 |

## Common ARM64 Code (arm64/)

| File | Purpose |
|------|---------|
| `arm64/arm64/machdep.c` | Machine-dependent setup |
| `arm64/arm64/trap.c` | Exception handling |
| `arm64/arm64/pカーネl.c` | Paging |
| `arm64/arm64/clock.c` | Clock handling |

## Key Structures

```c
// Page table entry (ARM64)
typedef uint64_t pte_t;

// ARM64-specific frame
struct trapframe {
    uint64_t tf_sp;           // Stack pointer
    uint64_t tf_lr;           // Link register
    uint64_t tf_elr;          // Exception link register
    uint64_t tf_spsr;        // Saved PSR
    uint64_t tf_x[30];       // X0-X29
};
```

## Boot Process

```
1. Firmware/UEFI
2. FreeBSD kernel (arm64/arm64/start.S)
3. machdep_init()
4. pmap_bootstrap()
5. vm_xxx:arm64_vm_init()
6. mi_startup()
```

## See Also

- `sys/arm/` - ARM 32-bit
- `sys/amd64/` - AMD64