# sys/ofed/ — InfiniBand/OpenFabrics Codebase Map

**Path:** `sys/ofed/`
**Purpose:** InfiniBand and OpenFabrics support

## Overview

The ofed directory contains support for InfiniBand and OpenFabrics.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `ofed/` | Main OFED code |
| `drivers/` | OFED drivers |

## Key Files

| File | Purpose |
|------|---------|
| `ofed.c` | OFED core |
| `ofed_var.h` | Variables |

## OFED Components

- IP over InfiniBand (IPoIB)
- RDMA (Remote DMA)
- uDAPL (Direct Access Programming Library)

## See Also

- `sys/dev/mlx5/` - Mellanox driver