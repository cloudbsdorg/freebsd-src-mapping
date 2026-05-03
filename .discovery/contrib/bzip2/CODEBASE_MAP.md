# contrib/bzip2/ — Bzip2 Compression Codebase Map

**Path:** `contrib/bzip2/`
**Purpose:** Bzip2 block-sorting compressor

## Overview

bzip2 is a block-sorting compressor.

## Key Files

| File | Purpose |
|------|---------|
| `blocksort.c` | Burrows-Wheeler transform |
| `huffman.c` | Huffman coding |
| `crctable.c` | CRC table |
| `randtable.c` | Random table |
| `bzlib.c` | Main |
| `bzlib.h` | Header |

## Command Line

```bash
bzip2 [flags] [files]
bzip2 -d [flags] [files]  # Decompress
bzip2 -z [flags] [files]  # Compress
```

## Library Interface

```c
int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen,
    char *source, unsigned int sourceLen, int blockSize, int verbosity, int workFactor);
int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen,
    char *source, unsigned int sourceLen, int small, int verbosity);
```

## See Also

- `lib/libbz2/` - Library