# lib/libusb/ — USB Library Codebase Map

**Path:** `lib/libusb/`
**Purpose:** USB access library

## Overview

libusb provides generic USB access for userland programs.

## Key Files

| File | Purpose |
|------|---------|
| `libusb.h` | Main header |
| `libusb10.h` | v1.0 API |
| `libusb20.h` | v2.0 API |
| `libusb10.c` | v1.0 impl |
| `libusb20.c` | v2.0 impl |

## USB Version

- `libusb10.c` - USB 1.0/1.1
- `libusb20.c` - USB 2.0

## Key Functions

```c
// Device discovery
ssize_t libusb_get_device_list(libusb_context *ctx, libusb_device ***list);
void libusb_free_device_list(libusb_device **list, int unref_devices);

// Device operations
int libusb_open(libusb_device *dev, libusb_device_handle **handle);
void libusb_close(libusb_device_handle *dev_handle);

// Communication
int libusb_bulk_transfer(libusb_transfer *xfer);
int libusb_interrupt_transfer(libusb_transfer *xfer);
int libusb_control_transfer(libusb_device_handle *dev_handle,
    uint8_t bmRequestType, uint8_t bRequest, uint16_t wValue, uint16_t wIndex,
    unsigned char *data, uint16_t wLength, unsigned int timeout);

// Configuration
int libusb_get_configuration(libusb_device_handle *dev, int *config);
int libusb_set_configuration(libusb_device_handle *dev, int config);
int libusb_claim_interface(libusb_device_handle *dev, int iface);
int libusb_release_interface(libusb_device_handle *dev, int iface);
```

## See Also

- `sys/dev/usb/` - Kernel USB