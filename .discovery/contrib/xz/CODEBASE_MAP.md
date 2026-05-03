# contrib/xz/ — XZ Compression Codebase Map

**Path:** `contrib/xz/`
**Purpose:** XZ/LZMA compression

## Overview

xz is a general-purpose compression tool.

## Key Files

| File | Purpose |
|------|---------|
| `xz/` | Main tool |
| `liblzma/` | Library |

## xz/ Commands

```bash
xz [flags] [files]
xz -d [flags] [files]  # Decompress
xz -t [flags] [files]  # Test
```

## liblzma/

| File | Purpose |
|------|---------|
| `api/lzma.h` | Public API |
| `common/ ` | Common |
| `check/ ` | Check |
| `filter/ ` | Filters |
| `rangecoder/ ` | Range coder |

## See Also

- `lib/liblzma/` - Library