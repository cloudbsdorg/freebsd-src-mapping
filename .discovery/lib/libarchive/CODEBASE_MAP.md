# lib/libarchive/ — Archive Library Codebase Map

**Path:** `lib/libarchive/`
**Purpose:** Multi-format archive and compression library

## Overview

libarchive supports reading/writing tar, pax, cpio, zip, 7z, ISO9660, and more.

## Key Files

| File | Purpose |
|------|---------|
| `archive_entry.c` | Archive entry |
| `archive_read.c` | Read archive |
| `archive_write.c` | Write archive |
| `archive_disk.c` | Disk archive |
| `archive_string.c` | String support |

## Archive Formats

| Format | Read | Write |
|--------|------|-------|
| `tar/` | Yes | Yes |
| `cpio/` | Yes | Yes |
| `pax/` | Yes | Yes |
| `zip/` | Yes | Yes |
| `7z/` | Yes | Yes |
| `iso9660/` | Yes | Yes |
| `mtree/` | Yes | Yes |

## Compression

| Codec | Support |
|-------|---------|
| `gzip/` | Read/Write |
| `bzip2/` | Read/Write |
| `lzma/` | Read/Write |
| `xz/` | Read/Write |
| `zstd/` | Read/Write |

## Key Functions

```c
struct archive *archive_read_new(void);
int archive_read_support_format_all(struct archive *);
int archive_read_support_compression_all(struct archive *);
int archive_read_open_filename(struct archive *, const char *, size_t);
int archive_read_next_header(struct archive *, struct archive_entry **);
int archive_read_data(struct archive *, void *, size_t);
int archive_read_free(struct archive *);

struct archive *archive_write_new(void);
int archive_write_set_format(struct archive *, int format);
int archive_write_open_filename(struct archive *, const char *);
int archive_write_header(struct archive *, struct archive_entry *);
int archive_write_data(struct archive *, const void *, size_t);
int archive_write_finish(struct archive *);
```

## See Also

- `bin/tar/` - Uses libarchive
- `usr.bin/zip/` - Uses libarchive