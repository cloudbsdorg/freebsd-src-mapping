# Codebase Map: sys/dev/cardbus

**Path:** `sys/dev/cardbus/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/cardbus/CODEBASE_MAP.md`

## Summary

PC Card (CardBus) framework. Supports 16-bit PCMCIA and 32-bit CardBus cards.

## Components

| File | Purpose |
|------|---------|
| cardbus.c | CardBus driver |
| cardbus_device.c | Device handling |
| cardbus_cis.c | Card Information Structure |
| card_if.m | Card interface |

## Dependencies

- `sys/dev/pci/` - PCI bus