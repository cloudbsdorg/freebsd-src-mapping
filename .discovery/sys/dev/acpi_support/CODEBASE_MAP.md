# Codebase Map: sys/dev/acpi_support

**Path:** `sys/dev/acpi_support/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/acpi_support/CODEBASE_MAP.md`

## Summary

ACPI-based drivers for laptop vendor-specific hardware (ASUS, HP, IBM, Toshiba, etc.). Provides control for hotkeys, LED indicators, brightness, wireless radios, and environmental sensors.

## Components

| File | Purpose |
|------|---------|
| acpi_asus.c | ASUS laptop features (hotkeys, LED, brightness) |
| acpi_hp.c | HP laptop features via WMI |
| acpi_ibm.c | IBM/Lenovo ThinkPad features |
| acpi_toshiba.c | Toshiba laptop features |
| acpi_sony.c | Sony VAIO laptop features |
| acpi_fujitsu.c | Fujitsu laptop features |
| acpi_panasonic.c | Panasonic Toughbook features |
| acpi_rapidstart.c | Rapid Start (fast boot) support |
| acpi_asus_wmi.c | ASUS WMI driver |
| acpi_sbl_wmi.c | SBL (Smart Battery?) WMI |
| acpi_system76.c | System76 laptop features |
| acpi_wmi.c | Generic ACPI-WMI mapping driver |
| acpi_wmi_if.m | ACPI-WMI interface definition |
| atk0110.c | ASUS AI Booster temperature/voltage/fan sensors |

## Key Dependencies

- `contrib/dev/acpica/` - ACPICA ACPI implementation
- `dev/acpica/` - FreeBSD ACPI framework
- `dev/led/` - LED subsystem

## See Also

- `sys/dev/acpica/` - ACPI subsystem