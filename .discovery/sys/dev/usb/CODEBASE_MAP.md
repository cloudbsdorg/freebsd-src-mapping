# sys/dev/usb/ — USB Stack Codebase Map

**Path:** `sys/dev/usb/`
**Purpose:** USB host controller and device support

## Key Files

| File | Purpose |
|------|---------|
| `usb_core.c` | USB core |
| `usb_hub.c` | Hub support |
| `usb_host.c` | Host controller |
| `usb_parse.c` | Descriptor parsing |
| `usb_request.c` | Control requests |
| `usb_transfer.c` | Transfers |

## USB Controllers

| Controller | Description |
|-----------|-------------|
| `ehci/` | USB 2.0 |
| `ohci/` | USB 1.1 |
| `xhci/` | USB 3.0 |

## USB Device Classes

| Class | Description |
|-------|-------------|
| `umass/` | Mass storage |
| `ukbd/` | Keyboard |
| `ums/` | Mouse |
| `uaudio/` | Audio |
| `ubsa/` | Serial |
| `ucom/` | Serial |
| `urio/` | Rio MP3 player |
| `uvic/` | Video |

## Transfer Types

- Control transfer
- Bulk transfer
- Interrupt transfer
- Isochronous transfer

## See Also

- `lib/libusb/` - Userland USB