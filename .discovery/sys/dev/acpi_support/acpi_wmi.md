# Component: acpi_wmi.c

**Path:** `sys/dev/acpi_support/acpi_wmi.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/acpi_support/acpi_wmi.md`

## Decomposition

#### Structs
struct acpi_wmi_softc

#### Methods
ACPI_WMI_REGFLAG_EXPENSIVE, ACPI_WMI_REGFLAG_METHOD, ACPI_WMI_REGFLAG_STRING, ACPI_WMI_REGFLAG_EVENT

## Purpose

Generic ACPI-WMI mapping driver. Provides interface for vendor-specific WMI implementations (HP, Acer, etc.) to access Windows Management Instrumentation data via ACPI.

## Dependencies

- `contrib/dev/acpica/` - ACPICA headers
- `dev/acpica/acpivar.h` - ACPI variables
- `dev/acpi_support/acpi_wmi_if.m` - WMI interface