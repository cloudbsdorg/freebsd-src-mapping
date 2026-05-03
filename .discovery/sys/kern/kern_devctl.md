# Component: kern_devctl.c

**Path:** `sys/kern/kern_devctl.c`
**Type:** File
**Maps to:** `.discovery/sys/kern/kern_devctl.md`

## Purpose

Device control interface - provides /dev/devctl for device hotplugging and control. Handles device attach/detach events and provides userland interface for device management.

## Structure

```mermaid
flowchart TD
    A[devctl_event - device event] --> B[queue event]
    B --> C[wakeup readers]
    D[devctl_queue_event - add] --> E[devd handler]
    F[devctl_set_driver - probe] --> G[business logic]
    H[/dev/devctl - read] --> I[return events]
    J[/dev/devctl - write] --> K[issue commands]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `devctl_event` | Generate event | `void devctl_event(const char *name, const char *subsystem, ...)` |
| `devctl_queue_event` | Queue event | `void devctl_queue_event(const char *name, const char *subsystem, ...)` |
| `devctl_notify` | Send notify | `int devctl_notify(const char *subsystem, ...)` |
| `devctl_set_driver` | Set driver | `int devctl_set_driver(device_t dev, const char *driver)` |
| `devctl_release` | Release device | `int devctl_release(void *data)` |

## Device Events

| Event | Description |
|-------|-------------|
| `DEVICE_EVT_ATTACH` | Device attached |
| `DEVICE_EVT_DETACH` | Device detached |
| `DEVICE_EVT_DRIVER` | Driver event |

## Subsystems

| Subsystem | Description |
|-----------|-------------|
| `device` | General device |
| `bus` | Bus events |
| `driver` | Driver events |

## devctl Device

| Operation | Description |
|-----------|-------------|
| `attach` | Attach device |
| `detach` | Detach device |
| `probe` | Probe device |

## devd Interface

| Path | Description |
|------|-------------|
| `/etc/devd.conf` | Devd configuration |
| `/var/run/devd.pipe` | Event pipe |

## Includes

- `sys/conf.h` - Conf definitions
- `sys/device.h` - Device definitions

## Depends On

- `kern_conf.c` for cdevsw
- `sys/bus.h` for bus interface