# lib/libbz2/ — Bzip2 Compression Library Codebase Map

**Path:** `lib/libbz2/`
**Purpose:** Bzip2 compression

## Overview

libbz2 provides the bzip2 compression library.

## Key Files

| File | Purpose |
|------|---------|
| `bzlib.c` | Main source |
| `bzlib.h` | Header |
| `blocksort.c` | Block sorting |
| `huffman.c` | Huffman coding |
| `crctable.c` | CRC table |
| `randtable.c` | Random table |

## Key Functions

```c
int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen,
    char *source, unsigned int sourceLen, int blockSize, int verbosity, int workFactor);

int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen,
    char *source, unsigned int sourceLen, int small, int verbosity);

BZFILE *BZ2_bzWriteOpen(int *bzerror, FILE *file, int blockSize, int verbosity, int workFactor);
void BZ2_bzWrite(int *bzerror, BZFILE *b, void *buf, int len);
void BZ2_bzWriteClose(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in, unsigned int *nbytes_out);

BZFILE *BZ2_bzReadOpen(int *bzerror, FILE *file, int verbosity, int small, void *unused, int nUnused);
int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len);
void BZ2_bzReadClose(int *bzerror, BZFILE *b);
```

## See Also

- `usr.bin/bzip2/` - Uses libbz2