# Component: sctp_crc32.c

**Path:** `sys/netinet/sctp_crc32.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/sctp_crc32.md`

## Purpose

SCTP CRC32 - CRC32C checksum for SCTP.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sctp_finalize_crc32c` | Finalize | `static uint32_t sctp_finalize_crc32c(uint32_t crc32c)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `sctp` | SCTP protocol |
| `crc32` | Checksum |

## Includes

- `netinet/sctp_crc32.h` - CRC32 definitions