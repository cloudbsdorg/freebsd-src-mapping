# Codebase Map: sys/dev/adb

**Path:** `sys/dev/adb/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/adb/CODEBASE_MAP.md`

## Summary

Apple Desktop Bus (ADB) framework. Supports older Apple devices via ADB.

## Components

| File | Purpose |
|------|---------|
| adb_bus.c | ADB bus driver |
| adb_kbd.c | ADB keyboard |
| adb_mouse.c | ADB mouse |
| adb_buttons.c | ADB buttons |
| adb_if.m | Interface |
| adb.h | Header |

## Dependencies

- `sys/dev/adb/` - ADB subsystem