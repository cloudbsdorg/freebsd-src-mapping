# sys/arm/ — ARM Architecture Codebase Map

**Path:** `sys/arm/`
**Purpose:** ARM processor support

## Overview

The arm directory contains code for ARM processors used in embedded systems and some mobile devices.

## Subarchitectures

### Allwinner

| Directory | Description |
|-----------|-------------|
| `allwinner/` | Allwinner SoC (A10, A13, A20, etc.) |
| `allwinner/a10/` | A10/A13 |
| `allwinner/a20/` | A20 (sun7i) |
| `allwinner/a31/` | A31 (sun6i) |

### Annapurna

| Directory | Description |
|-----------|-------------|
| `annapurna/` | Annapurna Labs Alpine |

### Broadcom

| Directory | Description |
|-----------|-------------|
| `broadcom/` | Broadcom SoC (BCM2835, BCM2836, etc.) |
| `broadcom/bcm2835/` | Raspberry Pi 1 |
| `broadcom/bcm2836/` | Raspberry Pi 2 |

### Freescale/NXP

| Directory | Description |
|-----------|-------------|
| `freescale/` | Freescale/NXP i.MX |
| `freescale/imx/` | i.MX series |

### Marvell

| Directory | Description |
|-----------|-------------|
| `mv/` | Marvell Kirkwood, Armada |
| `mv/armada8k/` | Armada 8K |
| `mv/armada37x0/` | Armada 37x0 |
| `mv/kirkwood/` | Kirkwood SoC |

### NVIDIA

| Directory | Description |
|-----------|-------------|
| `nvidia/` | NVIDIA Tegra |

### QEMU

| Directory | Description |
|-----------|-------------|
| `qemu/` | QEMU emulator support |

### Qualcomm

| Directory | Description |
|-----------|-------------|
| `qualcomm/` | Qualcomm Snapdragon |

### Rockchip

| Directory | Description |
|-----------|-------------|
| `rockchip/` | Rockchip RK3288, RK3399 |

### Texas Instruments

| Directory | Description |
|-----------|-------------|
| `ti/` | TI OMAP, BeagleBone |
| `ti/omap3/` | OMAP3 |
| `ti/omap4/` | OMAP4 |
| `ti/ti81xx/` | TI81xx |

### Xilinx

| Directory | Description |
|-----------|-------------|
| `xilinx/` | Xilinx Zynq |

## Common ARM Code (arm/arm/)

| File | Purpose |
|------|---------|
| `arm/arm/machdep.c` | Machine-dependent setup |
| `arm/arm/trap.c` | Exception handling |
| `arm/arm/cache.c` | Cache management |
| `arm/arm/clock.c` | Clock handling |

## Key Structures

```c
// Page table entry (ARM)
typedef uint32_t pte_t;

// ARM-specific frame
struct trapframe {
    uint32_t tf_sp;           // Stack pointer
    uint32_t tf_lr;           // Link register
    uint32_t tf_spsr;        // Saved PSR
    uint32_t tf_pc;           // Program counter
    uint32_t tf_r0_r11[12];  // Registers
};
```

## Boot Process

```
1. ROM bootloader
2. Secondary bootloader (u-boot, etc.)
3. FreeBSD kernel (arm/arm/start.S)
4. machdep.c:arm_ginit()
5. vm_xxx:arm_vm_init()
6. initarm() per-SoC
```

## See Also

- `sys/arm64/` - ARM64 (AArch64)
- `sys/cpu/` - CPU-specific code