# sys/dev/mlx5/ — Mellanox ConnectX Driver Codebase Map

**Path:** `sys/dev/mlx5/`
**Purpose:** Mellanox ConnectX Ethernet/InfiniBand driver

## Overview

The mlx5 driver supports Mellanox ConnectX-4/5 network adapters.

## Key Files

| File | Purpose |
|------|---------|
| `mlx5.c` | Main |
| `mlx5_ib.c` | IB |
| `mlx5_core/` | Core |
| `mlx5_en/` | Ethernet |

## Supported Devices

| Device | Description |
|--------|-------------|
| ConnectX-4 | 40/56GbE |
| ConnectX-4 Lx | 25GbE |
| ConnectX-5 | 100GbE |
| ConnectX-5 Ex | 100GbE |

## Features

- SR-IOV
- RDMA (RoCE, IB)
- Flow director
- VXLAN offload

## See Also

- `sys/dev/mlx4/` - Mellanox ConnectX-3