# lib/libz/ — Zlib Compression Library Codebase Map

**Path:** `lib/libz/`
**Purpose:** Zlib compression

## Overview

libz provides the zlib compression library.

## Key Files

| File | Purpose |
|------|---------|
| `zlib.c` | Main source |
| `zlib.h` | Header |

## Key Functions

```c
// Compression
uLong compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);
uLong compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level);
int compressBound(uLong sourceLen);

// Decompression
uLong uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);

// Streaming
z_streamp deflateInit(z_streamp strm, int level);
int deflate(z_streamp strm, int flush);
int deflateEnd(z_streamp strm);

z_streamp inflateInit(z_streamp strm);
int inflate(z_streamp strm, int flush);
int inflateEnd(z_streamp strm);
```

## Compression Levels

| Level | Description |
|-------|-------------|
| Z_NO_COMPRESSION | No compression |
| Z_BEST_SPEED | Fastest |
| Z_DEFAULT_COMPRESSION | Default |
| Z_BEST_COMPRESSION | Best ratio |

## See Also

- `usr.bin/gzip/` - Uses libz