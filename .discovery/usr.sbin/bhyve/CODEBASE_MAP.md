# usr.sbin/bhyve/ — BHyve Hypervisor Codebase Map

**Path:** `usr.sbin/bhyve/`
**Purpose:** BSD hypervisor

## Overview

bhyve is the BSD hypervisor for virtualization.

## Key Files

| File | Purpose |
|------|---------|
| `bhyve.c` | Main |
| `boot.c` | Boot |
| `console.c` | Console |
| `cpu.c` | CPU |
| `dbg.c` | Debug |
| `fpu.c` | FPU |
| `gdb.c` | GDB |
| `ioapic.c` | IOAPIC |
| `lapic.c` | LAPIC |
| `mem.c` | Memory |
| `msr.c` | MSR |
| `pci_ahci.c` | AHCI |
| `pci_e1000.c` | E1000 |
| `pci_hostbridge.c` | Host bridge |
| `pci_nvme.c` | NVMe |
| `pci_ahci.c` | AHCI |
| `pci_xhci.c` | XHCI |
| `pci_passthrough.c` | Passthrough |
| `xmsr.c` | x86 MSR |

## See Also

- `lib/libvmmapi/` - VMM API