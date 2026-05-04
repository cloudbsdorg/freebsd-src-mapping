# Codebase Map: sys/dev/hid

**Path:** `sys/dev/hid/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/hid/CODEBASE_MAP.md`

## Summary

Human Interface Device framework. Supports keyboards, mice, gamepads, and other HID devices.

## Components

| File | Purpose |
|------|---------|
| hid.c | Core HID driver |
| hidbus.c | HID bus driver |
| hidmap.c | HID mapping |
| hidquirk.c | Device quirks |
| hidraw.c | Raw HID access |

## Device Drivers

| File | Purpose |
|------|---------|
| hkbd.c | Keyboard |
| hms.c | Mouse |
| hmt.c | Multi-touch |
| hgame.c | Gamepad |
| hpen.c | Pen/stylus |
| hsctrl.c | System control |
| u2f.c | U2F/FIDO key |
| bcm5974.c | Apple trackpad |
| appleir.c | Apple remote |

## Dependencies

- `sys/usb/` - USB HID support