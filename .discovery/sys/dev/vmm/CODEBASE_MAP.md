# Codebase Map: sys/dev/vmm

**Path:** `sys/dev/vmm/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/vmm/CODEBASE_MAP.md`

## Summary

bhyve virtual machine monitor. Provides hardware virtualization for running guest VMs.

## Components

| File | Purpose |
|------|---------|
| vmm_vm.c | VM management |
| vmm_mem.c | Memory management |
| vmm_dev.c | /dev/vmm device |
| vmm_stat.c | Statistics |

## Dependencies

- `sys/amd64/vmm/` - AMD-V/VT-x hardware support