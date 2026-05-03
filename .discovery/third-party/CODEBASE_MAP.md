# third-party/ — Third-Party Software Codebase Map

**Path:** `contrib/`, `cddl/`, `gnu/`, `crypto/`
**Total Packages:** 92+ (contrib)

## Overview

The third-party software directories contain upstream open source projects integrated into FreeBSD. Each has its own license (BSD, GPL, LGPL, etc.) and is maintained separately.

---

## contrib/ — Third-Party Software (BSD-like Licenses)

**Path:** `contrib/`
**Count:** 92 packages

### Core Utilities

| Package | Description | License |
|---------|-------------|---------|
| `atf/` | Automated Testing Framework | BSD |
| `bsddialog/` | BSD dialog library | BSD |
| `libarchive/` | Archive library | BSD |
| `libedit/` | Edit line library | BSD |
| `libevent/` | Event loop | BSD |
| `libpcap/` | Packet capture | BSD |
| `libucl/` | UCL config | BSD |
| `mandoc/` | Manual tools | BSD |
| `mtree/` | mtree utility | BSD |
| `sqlite3/` | SQLite database | Public Domain |
| `unbound/` | DNS resolver | BSD |

### Compression & Archives

| Package | Description | License |
|---------|-------------|---------|
| `bzip2/` | BZIP2 | BSD |
| `xz/` | XZ compression | Public Domain |

### Development Tools

| Package | Description | License |
|---------|-------------|---------|
| `byacc/` | Yacc clone | Public Domain |
| `clang/` | Clang/LLVM | Apache2/LLVM |
| `flex/` | Lexer | BSD |
| `llvm-project/` | LLVM/Clang | Apache2/LLVM |

### Networking

| Package | Description | License |
|---------|-------------|---------|
| `tcpdump/` | Packet sniffer | BSD |
| `tcp_wrappers/` | TCP wrappers | BSD |
| `wpa/` | WPA supplicant | BSD |

### Shells & Interpreters

| Package | Description | License |
|---------|-------------|---------|
| `tcsh/` | TC Shell | BSD |
| `telnet/` | Telnet client | BSD |
| `lua/` | Lua language | Lua |

---

## cddl/ — CDDL-Licensed Software

**Path:** `cddl/`

### DTrace

| Component | Description |
|-----------|-------------|
| `dtrace/` | DTrace user tools |
| `libdtrace/` | DTrace library |

### ZFS

| Component | Description |
|-----------|-------------|
| `zfs/` | ZFS filesystem |
| `libzfs/` | ZFS library |

---

## gnu/ — GPL/LGPL Software

**Path:** `gnu/`

### GNU Core Utils

| Package | Description | License |
|---------|-------------|---------|
| `binutils/` | GNU binutils | GPL |
| `gcc/` | GCC | GPL |
| `grep/` | grep | GPL |
| `gzip/` | gzip | GPL |
| `patch/` | patch | GPL |
| `sed/` | sed | GPL |

---

## crypto/ — Cryptographic Software

**Path:** `crypto/`

### Heimdal Kerberos

| Component | Description |
|-----------|-------------|
| `heimdal/` | Heimdal Kerberos 5 |

### OpenSSL

| Component | Description |
|-----------|-------------|
| `openssl/` | OpenSSL 3.x |

### OpenSSH

| Component | Description |
|-----------|-------------|
| `openssh/` | OpenSSH |

---

## License Summary

| License | Packages |
|---------|----------|
| BSD | Most contrib |
| GPL | GNU tools, grep, gzip, etc. |
| CDDL | DTrace, ZFS |
| Apache 2.0 | LLVM/Clang |
| Public Domain | sqlite3, xz |

---

## Key Upstream Projects

| Project | Location | Purpose |
|---------|----------|---------|
| LLVM/Clang | `contrib/llvm-project/` | Compiler |
| OpenSSL | `crypto/openssl/` | Crypto |
| OpenSSH | `crypto/openssh/` | SSH |
| Heimdal | `crypto/heimdal/` | Kerberos |
| ZFS | `cddl/zfs/` | Filesystem |
| DTrace | `cddl/dtrace/` | Tracing |
| SQLite | `contrib/sqlite3/` | Database |