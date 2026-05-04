# Component: acpi_asus.c

**Path:** `sys/dev/acpi_support/acpi_asus.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/acpi_support/acpi_asus.md`

## Decomposition

#### Structs
struct acpi_asus_model

#### Methods
ACPI_ASUS_METHOD_BRN, ACPI_ASUS_METHOD_DISP, ACPI_ASUS_METHOD_LCD, ACPI_ASUS_METHOD_CAMERA, ACPI_ASUS_METHOD_CARDRD, ACPI_ASUS_METHOD_WLAN

## Purpose

Driver for ASUS laptop ACPI-controlled features: hotkeys, LED indicators (backlight, display, keyboard, etc.), brightness control, camera, card reader, wireless toggle.

## Dependencies

- `contrib/dev/acpica/` - ACPICA headers
- `dev/acpica/acpivar.h` - ACPI variable definitions
- `dev/led/led.h` - LED subsystem