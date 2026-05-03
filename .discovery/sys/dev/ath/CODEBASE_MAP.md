# sys/dev/ath/ — Atheros Wireless Driver Codebase Map

**Path:** `sys/dev/ath/`
**Purpose:** Atheros ARxxxx wireless network driver

## Overview

The ath driver supports Atheros-based wireless network cards.

## Key Files

| File | Purpose |
|------|---------|
| `ath_hal/ ` | Hardware abstraction |
| `ath/ ` | Core driver |
| `ratectrl/ ` | Rate control |

## Key Subdirectories

| Subdir | Purpose |
|--------|---------|
| `ath_hal/` | Hardware layer |
| `ar5210/` | AR5210 (11a) |
| `ar5211/` | AR5211 (11a/b) |
| `ar5212/` | AR5212 (11a/b/g) |
| `ar5416/` | AR5416 (11n) |
| `ar9300/` | AR9300 (11n) |

## Chipset Support

- AR5210 (802.11a)
- AR5211 (802.11a/b)
- AR5212 (802.11a/b/g)
- AR5416 (802.11n)
- AR9300 (802.11n)

## See Also

- `sys/net80211/` - 802.11 stack