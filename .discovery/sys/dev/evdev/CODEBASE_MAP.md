# sys/dev/evdev/ — Event Device Driver Codebase Map

**Path:** `sys/dev/evdev/`
**Purpose:** Input event devices

## Overview

The evdev driver provides support for input event devices.

## Key Files

| File | Purpose |
|------|---------|
| `evdev.c` | Main |
| `evdev_private.h` | Private |
| `evdev_mt.c` | Multitouch |
| `evdev_utils.c` | Utils |

## Key Functions

```c
int evdev_register(struct evdev_dev *);
int evdev_unregister(struct evdev_dev *);
void evdev_push_event(struct evdev_dev *, uint16_t, uint16_t, int32_t);
```

## See Also

- `sys/dev/input/` - Input devices