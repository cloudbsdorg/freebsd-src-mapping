# Codebase Map: sys/dev/iommu

**Path:** `sys/dev/iommu/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/iommu/CODEBASE_MAP.md`

## Summary

IOMMU framework. Provides DMA remapping and interrupt remapping.

## Components

| File | Purpose |
|------|---------|
| iommu_gas.c | Guest address space |
| busdma_iommu.c | BusDMA integration |

## Dependencies

- `sys/amd64/iommu/` - AMD64 IOMMU