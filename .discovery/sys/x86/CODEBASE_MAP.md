# sys/x86/ — x86 Architecture Common Codebase Map

**Path:** `sys/x86/`
**Purpose:** Shared x86 code between i386 and AMD64

## Overview

The x86 directory contains code shared between i386 and AMD64 architectures.

## Subdirectories

### BIOS (bios/)

| Directory | Purpose |
|-----------|---------|
| `bios/` | BIOS/UEFI interface |

### ACPI (acpica/)

| Directory | Purpose |
|-----------|---------|
| `acpica/` | ACPICA interpreter |

### CPU Frequency (cpufreq/)

| Directory | Purpose |
|-----------|---------|
| `cpufreq/` | CPU frequency scaling |

### IOMMU (iommu/)

| Directory | Purpose |
|-----------|---------|
| `iommu/` | IOMMU support (VT-d, AMD-Vi) |

### ISA (isa/)

| Directory | Purpose |
|-----------|---------|
| `isa/` | ISA bus support |

### PCI (pci/)

| Directory | Purpose |
|-----------|---------|
| `pci/` | PCI configuration |

### Linux Compatibility (linux/)

| Directory | Purpose |
|-----------|---------|
| `linux/` | Linux compatibility |

### Xen (xen/)

| Directory | Purpose |
|-----------|---------|
| `xen/` | Xen hypervisor support |

### Common x86 (x86/)

| Directory | Purpose |
|-----------|---------|
| `x86/` | Common x86 code |

### Configuration (conf/)

| Directory | Purpose |
|-----------|---------|
| `conf/` | x86 configuration |

## IOMMU

```c
// Intel VT-d
struct dmar_unit {
    struct dmar_hw_global   *hw;
    struct dmar_domain      *domain;
    TAILQ_HEAD(, dmar_drhd) drhd;    // DRHD units
};

// AMD-Vi (IOMMU)
struct amdvi_softc {
    struct device    *dev;
    uint64_t         mmio_base;
    struct amdvi_domain *domain;
};
```

## BIOS/UEFI

```c
// BIOS call structure
struct bios_offer {
    uint16_t    ax, bx, cx, dx;     // Registers
    uint16_t    si, di, bp, sp;    // Index registers
    uint8_t     ds, es;            // Segment registers
    int         mode;               // 16/32/64-bit
};
```

## CPU Frequency

```c
// CPU frequency driver
struct cpufreq_driver {
    const char  *name;
    int         (*init)(struct cpufreq_arg *);
    int         (*set)(int mhz);
    int         (*get)(void);
};
```

## Key Dependencies

```c
#include <machine/bus.h>         // Bus I/O
#include <x86/bios.h>           // BIOS
#include <x86/acpi.h>           // ACPI
```

## See Also

- `sys/amd64/` - AMD64 architecture
- `sys/i386/` - i386 architecture
- `sys/amd64/acpica/` - AMD64 ACPI