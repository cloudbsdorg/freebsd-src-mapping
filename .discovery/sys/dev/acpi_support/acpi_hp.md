# Component: acpi_hp.c

**Path:** `sys/dev/acpi_support/acpi_hp.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/acpi_support/acpi_hp.md`

## Purpose

Driver for HP laptop ACPI/WMI features: display switching, HDD temperature, ALS (ambient light sensor), dock control, wireless radios, BIOS settings, hotkeys, battery feature control.

## Dependencies

- `dev/acpi_support/acpi_wmi_if.m` - WMI interface
- `contrib/dev/acpica/` - ACPICA headers
- `dev/acpica/acpivar.h` - ACPI variables