# Codebase Map: sys/dev/e1000

**Path:** `sys/dev/e1000/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/e1000/CODEBASE_MAP.md`

## Summary

Intel 8254x/8257x Gigabit Ethernet driver. Legacy Intel gigabit driver.

## Components

| File | Purpose |
|------|---------|
| e1000_82541.c | 82541/82547 |
| e1000_82542.c | 82542 |
| e1000_82543.c | 82543 |
| e1000_82571.c | 82571/82572 |
| e1000_82575.c | 82575/82576 |
| e1000_i210.c | i210/i211 |
| e1000_api.c | API |
| e1000_base.c | Base |

## Dependencies

- `dev/pci/` - PCI bus