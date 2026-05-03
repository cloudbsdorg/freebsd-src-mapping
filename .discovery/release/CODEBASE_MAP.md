# release/ — Release Build System Codebase Map

**Path:** `release/`
**Purpose:** Build system for FreeBSD releases

## Overview

The release directory contains the build system for creating FreeBSD releases and VM images.

## Key Files

| File | Purpose |
|------|---------|
| `release.sh` | Main release script |
| `Makefile` | Release makefile |
| `release.conf` | Release configuration |

## Building a Release

```bash
cd release
./release.sh
```

## Release Outputs

- ISO images
- VM images (QCOW2, VHD, VMDK)
- Tarballs
- USB images

## See Also

- `tools/` - Build tools