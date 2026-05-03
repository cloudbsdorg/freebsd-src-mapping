# sys/dev/uart/ — UART Driver Codebase Map

**Path:** `sys/dev/uart/`
**Purpose:** Universal Asynchronous Receiver/Transmitter

## Overview

The uart driver provides generic UART support.

## Key Files

| File | Purpose |
|------|---------|
| `uart_dev_ns16550.c` | NS16550 |
| `uart_dev_sab82532.c` | SAB82532 |
| `uart_dev_z8530.c` | Z8530 |
| `uart_bus_isa.c` | ISA bus |
| `uart_bus_pci.c` | PCI bus |

## Key Structures

```c
struct uart_softc {
    device_t dev;
    struct uart_class *class;
    struct uart_pargs *args;
    bus_space_handle_t bsh;
    bus_space_tag_t iot;
    // ... more
};
```

## See Also

- `sys/dev/ic/` - IC devices