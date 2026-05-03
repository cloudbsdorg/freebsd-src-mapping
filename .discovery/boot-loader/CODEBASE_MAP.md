# boot-loader/ — Boot Loader Codebase Map

**Path:** `stand/`, `rescue/`

## Overview

The boot loader directories contain the boot loader sources and statically linked rescue utilities.

---

## stand/ — Boot Loader Sources

**Path:** `stand/`

### Architecture-Specific

| Directory | Description |
|-----------|-------------|
| `arm64/` | ARM64 boot loader |
| `i386/` | i386 boot loader |
| `powerpc/` | PowerPC boot loader |

### Core Components

| Directory | Description |
|-----------|-------------|
| `common/` | Shared boot code |
| `efi/` | EFI boot manager |
| `ficl/` | FICL Forth interpreter |
| `forth/` | Forth scripts |
| `liblua/` | Lua support |
| `libsa/` | Standalone library |
| `loader/` | Main loader |

### Key Files

| File | Description |
|------|-------------|
| `Makefile` | Boot loader build |
| `loader.mk` | Loader make includes |

---

## rescue/ — Rescue Utilities

**Path:** `rescue/`

### Purpose

Statically linked utilities for recovery when normal system tools are unavailable.

### Structure

```
rescue/
├── librescue/          # Shared rescue library
├── rescue/             # Individual rescue programs
├── Makefile
└── README
```

### Build System

```bash
# Build rescue utilities
cd rescue && make
```

### Key Programs

| Program | Description |
|---------|-------------|
| test rescue/test | Test rescue build |
| rescue/fsck_* | Filesystem checkers |
| rescue/nvmecontrol | NVMe control |

---

## Build System

### Boot Loader

```bash
# Build for specific architecture
cd stand/i386 && make

# Build EFI loader
cd stand/efi && make
```

### Combined Build

The boot loader is built as part of:
```bash
make buildworld
make buildkernel
```