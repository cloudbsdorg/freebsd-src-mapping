# stand/ — Boot Loader Codebase Map

**Path:** `stand/`
**Purpose:** Boot loader for system startup

## Overview

The stand directory contains the FreeBSD boot loader, including EFI support.

## Directory Structure

```
stand/
├── efi/               # EFI loader
│   └── efi/           # EFI boot manager
├── lua/               # Lua scripting
├── zfsloader/          # ZFS bootloader
├── i386/              # i386 boot
├── amd64/             # AMD64 boot
├── common/            # Shared code
└── ext2fs/            # ext2fs boot
```

## Key Files

| File | Purpose |
|------|---------|
| `efi/loader.efi` | EFI bootloader |
| `i386/boot0` | Boot0 boot manager |
| `i386/boot1` | Boot1 first stage |
| `i386/boot2` | Boot2 second stage |

## Boot Sequence

```
BIOS/UEFI → boot1 → boot2 → loader → kernel
```

## Loader Commands

```
load kernel
load -t zfs zfspool/boot/kernel/kernel
boot
```

## See Also

- `sys/boot/` - Boot-related kernel code