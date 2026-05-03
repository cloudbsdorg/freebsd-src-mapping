# sys/dev/re/ — Realtek Ethernet Driver Codebase Map

**Path:** `sys/dev/re/`
**Purpose:** Realtek RTL8139/8169/8111

## Overview

The re driver supports Realtek Ethernet controllers.

## Key Files

| File | Purpose |
|------|---------|
| `if_re.c` | Main |
| `if_ reg.h` | Registers |

## Supported Chips

| Chip | Description |
|------|-------------|
| RTL8139 | 10/100 |
| RTL8169 | Gigabit |
| RTL8111 | Gigabit |
| RTL810xE | Fast |

## See Also

- `sys/net/` - Network stack