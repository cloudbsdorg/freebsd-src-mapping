# FreeBSD src — Codebase Map

**Repository:** https://github.com/cloudbsdorg/freebsd-src-mapping
**Source:** FreeBSD src (mainline)
**License:** BSD 3-Clause / Various (see individual directories)

## Overview

This is the top level of the FreeBSD source directory. FreeBSD is an operating system used to power modern servers, desktops, and embedded platforms. A large community has continually developed it for more than thirty years.

## Top-Level Directory Tree

```
freebsd-src/
├── .arcconfig              # Arc Configuration (Phabricator)
├── .arclint               # Arc linting rules
├── .cirrus-ci/            # Cirrus CI configuration
├── .clang-format          # Clang formatting rules
├── .editorconfig          # Editor configuration
├── .git-blame-ignore-revs # Git blame ignore list
├── .github/               # GitHub workflows
├── .gitattributes         # Git attributes
├── .gitignore             # Git ignore patterns
├── .mailmap               # Mail mapping for contributors
│
├── bin/                   # Essential user commands (44 entries)
├── cddl/                  # CDDL-licensed third-party software
├── contrib/               # Third-party software (92 entries)
├── crypto/                # Cryptographic libraries (OpenSSL, OpenSSH, Heimdal)
├── etc/                   # Template files for /etc
├── gnu/                   # GPL/LGPL licensed software
├── include/               # System header files
├── kerberos5/             # Kerberos 5 (Heimdal) build system
├── krb5/                  # Kerberos 5 (MIT) build system
├── lib/                   # System libraries (157 entries)
├── libexec/               # System commands executed by others (38 entries)
├── LOCKS                  # Lock file documentation
├── MAINTAINERS            # Maintainer list
├── Makefile               # Top-level build file
├── Makefile.inc1          # Build includes
├── Makefile.libcompat     # Library compatibility
├── Makefile.sys.inc       # System build includes
├── ObsoleteFiles.inc      # Obsolete file list
├── packages/              # Package build system
├── release/               # Release build system
├── rescue/                # Statically linked /rescue utilities
├── sbin/                  # System administration commands (90 entries)
├── secure/                # Secure/libcrypto build system
├── share/                 # Shared resources (32 entries)
├── stand/                 # Boot loader sources (33 entries)
├── sys/                   # Kernel sources (53 entries)
├── targets/               # DIRDEPS_BUILD support
├── tests/                 # Kyua test suite
├── tools/                 # Ancillary utilities (22 entries)
├── UPDATING               # Update notes
├── usr.bin/               # User commands (282 entries)
└── usr.sbin/              # System administration commands (236 entries)
```

## Directory Summary

### Kernel & Core

| Directory | Description | Entries |
|-----------|-------------|---------|
| `sys/` | Kernel sources | 53 |
| `crypto/` | Cryptographic libraries (OpenSSL, OpenSSH, Heimdal) | 7 |
| `stand/` | Boot loader sources | 33 |
| `rescue/` | Statically linked rescue utilities | 4 |

### Userland Commands

| Directory | Description | Entries |
|-----------|-------------|---------|
| `bin/` | Essential user commands | 44 |
| `sbin/` | System administration commands | 90 |
| `usr.bin/` | User commands | 282 |
| `usr.sbin/` | System administration commands | 236 |
| `libexec/` | Commands executed by other programs | 38 |

### Libraries

| Directory | Description | Entries |
|-----------|-------------|---------|
| `lib/` | System libraries | 157 |
| `secure/` | Cryptographic libraries build | 9 |
| `include/` | System header files | - |

### Third-Party Software

| Directory | Description | Entries |
|-----------|-------------|---------|
| `contrib/` | Third-party software | 92 |
| `cddl/` | CDDL-licensed software | - |
| `gnu/` | GPL/LGPL software | - |

### Boot & System

| Directory | Description |
|-----------|-------------|
| `stand/` | Boot loader (EFI, BIOS, ARM) |
| `rescue/` | /rescue utilities (statically linked) |
| `release/` | Release build system |
| `etc/` | /etc template files |

### Documentation & Testing

| Directory | Description |
|-----------|-------------|
| `share/` | Shared resources, man pages, locales |
| `tests/` | Kyua test suite |
| `tools/` | Ancillary utilities |

## Architecture Support

FreeBSD supports multiple CPU architectures:

- **amd64** — 64-bit x86 (primary desktop/server)
- **i386** — 32-bit x86
- **arm** — ARM (32-bit)
- **arm64** — ARM (64-bit) / AArch64
- **powerpc** — PowerPC (32-bit)
- **powerpc64** — PowerPC (64-bit)
- **riscv** — RISC-V
- **x86/** — x86 architecture-specific code (includes x86/x86)

## Build System

The top-level `Makefile` supports various build targets:

```bash
# Build userland
make buildworld

# Build kernel
make buildkernel KERNCONF=YOUR_KERNEL

# Install
make installworld
make installkernel

# Clean
make cleanworld
make cleankernel
```

See `build(7)`, `config(8)`, and the FreeBSD Handbook for more build options.

## Key Files

| File | Purpose |
|------|---------|
| `Makefile` | Top-level build targets |
| `Makefile.inc1` | Build system includes |
| `sys/README.md` | Kernel source documentation |
| `tests/README` | Test suite documentation |
| `CONTRIBUTING.md` | Contribution guidelines |
| `COPYRIGHT` | Copyright information |
| `MAINTAINERS` | Maintainer contacts |

## Related Documentation

- [FreeBSD Handbook](https://docs.freebsd.org/en/books/handbook/)
- [Building FreeBSD](https://docs.freebsd.org/en/books/handbook/cutting-edge/)
- [Kernel Configuration](https://docs.freebsd.org/en/books/handbook/kernelconfig/)
- [Platforms](https://www.freebsd.org/platforms/)