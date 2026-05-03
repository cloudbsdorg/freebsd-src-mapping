# contrib/libarchive/ — Libarchive Source Codebase Map

**Path:** `contrib/libarchive/`
**Purpose:** Archive library source

## Overview

libarchive in contrib is the upstream source, while `lib/libarchive/` is the FreeBSD-integrated copy.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `libarchive/` | Main library |
| `tar/` | Tar program |
| `cat/` | Cat utility |
| `cpio/` | Cpio program |

## Key Source Files

| File | Purpose |
|------|---------|
| `libarchive/archive_read.c` | Read archive |
| `libarchive/archive_write.c` | Write archive |
| `libarchive/archive_entry.c` | Entry |
| `libarchive/archive_match.c` | Matching |
| `libarchive/archive_virtual.c` | VFS |

## Supported Formats

- tar (ustar, pax, gnu)
- cpio (odc, newc, crc)
- iso9660
- zip (including xz, bz2)
- 7z
- mtree
- raw

## Supported Compression

- gzip, bzip2, xz, lzma
- compress (.Z)
- zstd

## See Also

- `lib/libarchive/` - FreeBSD integrated