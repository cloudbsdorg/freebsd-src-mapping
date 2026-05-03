# lib/liblzma/ — XZ Compression Library Codebase Map

**Path:** `lib/liblzma/`
**Purpose:** XZ/LZMA compression

## Overview

liblzma provides the XZ compression library.

## Key Files

| File | Purpose |
|------|---------|
| `liblzma.h` | Header |
| `api/ ` | API subdir |

## Key Functions

```c
// Compression
lzma_ret lzma_stream_encoder(lzma_stream *strm, uint64_t preset, lzma_check check);
lzma_ret lzma_easy_encoder(lzma_stream *strm, uint32_t preset, lzma_check check);

// Decompression
lzma_ret lzma_stream_decoder(lzma_stream *strm, uint64_t memlimit, uint32_t flags);

// I/O
lzma_ret lzma_stream_read(lzma_stream *strm, uint8_t *buf, size_t size);
lzma_ret lzma_stream_write(lzma_stream *strm, const uint8_t *buf, size_t size);
```

## See Also

- `usr.bin/xz/` - Uses liblzma