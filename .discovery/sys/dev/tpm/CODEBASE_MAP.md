# Codebase Map: sys/dev/tpm

**Path:** `sys/dev/tpm/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/tpm/CODEBASE_MAP.md`

## Summary

Trusted Platform Module (TPM) driver. Supports TPM 1.2 and TPM 2.0 devices via various bus interfaces (CRB, TIS, ACPI, ISA, SPI).

## Components

| File | Purpose |
|------|---------|
| tpm.c | Main TPM driver |
| tpm20.c | TPM 2.0 support |
| tpm_acpi.c | ACPI TPM interface |
| tpm_bus.c | Bus abstraction |
| tpm_crb.c | Command Response Buffer interface |
| tpm_tis_core.c | TPM TIS core |
| tpm_tis_acpi.c | TIS over ACPI |
| tpm_tis_spibus.c | TIS over SPI |
| tpm_spibus.c | SPI TPM |
| tpm_isa.c | ISA TPM |
| tpm_if.m | TPM interface definition |

## Dependencies

- `sys/security/` - Security subsystem