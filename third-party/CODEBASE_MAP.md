# Third-Party Software — Codebase Map

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
| `bsnmp/` | BSD SNMP | BSD |
| `bsnmp/` | SNMP tools | BSD |
| `dialog/` | Dialog utility | LGPL |
| `lib9p/` | 9P protocol | BSD |
| `libarchive/` | Archive library | BSD |
| `libbegemot/` | Begemot library | BSD |
| `libc-vis/` | BSD vis library | BSD |
| `libedit/` | Edit line library | BSD |
| `libevent/` | Event loop | BSD |
| `libexecinfo/` | Exec info | BSD |
| `libfido2/` | FIDO2 | BSD |
| `libpcap/` | Packet capture | BSD |
| `libucl/` | UCL config | BSD |
| `libxo/` | Text output | BSD |
| `libyaml/` | YAML parser | BSD |
| `mandoc/` | Manual tools | BSD |
| `mtree/` | mtree utility | BSD |
| `netcat/` | Netcat | BSD |
| `openresolv/` | Resolver | BSD |
| `pjdlog/` | Logging | BSD |
| `sendmail/` | Sendmail MTA | Sendmail |
| `smbfs/` | SMB/CIFS | BSD |
| `spleen/` | Spleen firmware | BSD |
| `sqlite3/` | SQLite database | Public Domain |
| `tnftp/` | FTP client | BSD |
| `ts/` | Timestamp | BSD |
| `unbound/` | DNS resolver | BSD |
| `unvis/` | Unvis utility | BSD |
| `vis/` | Vis utility | BSD |
| `wireguard-tools/` | WireGuard | GPL |

### Compression & Archives

| Package | Description | License |
|---------|-------------|---------|
| `bzip2/` | BZIP2 | BSD |
| `file/` | File detection | BSD |
| `xz/` | XZ compression | Public Domain |
| `zip/` | ZIP archive | Info-ZIP |

### Development Tools

| Package | Description | License |
|---------|-------------|---------|
| `byacc/` | Yacc clone | Public Domain |
| `clang/` | Clang/LLVM | Apache2/LLVM |
| `elftoolchain/` | ELF tools | BSD |
| `flex/` | Lexer | BSD |
| `ldns/` | DNS library | BSD |
| `llvm-project/` | LLVM/Clang | Apache2/LLVM |
| `one-true-awk/` | AWK | AWK |
| `kyua/` | Testing framework | BSD |
| `lutok/` | C++ testing | BSD |
| `lyaml/` | YAML | MIT |
| `mknod/` | Mknod | BSD |

### Networking

| Package | Description | License |
|---------|-------------|---------|
| `bzip2/` | Compression | BSD |
| `tcpdump/` | Packet sniffer | BSD |
| `tcp_wrappers/` | TCP wrappers | BSD |
| `wpa/` | WPA supplicant | BSD |

### Shells & Interpreters

| Package | Description | License |
|---------|-------------|---------|
| `tcsh/` | TC Shell | BSD |
| `telnet/` | Telnet client | BSD |
| `less/` | Pager | GPL |
| `lua/` | Lua language | Lua |

### Kerberos & Security

| Package | Description | License |
|---------|-------------|---------|
| `heimdal/` | Kerberos 5 (Heimdal) | BSD |
| `openpam/` | PAM | BSD |
| `pam-krb5/` | Kerberos PAM | BSD |

### Filesystems

| Package | Description | License |
|---------|-------------|---------|
| `ext2fs/` | ext2/ext3 (via gnu) | GPL |
| `puffs/` | Userspace FUSE | BSD |

### Misc

| Package | Description | License |
|---------|-------------|---------|
| `bcm58712/` | Broadcom | Proprietary |
| `file/` | File types | BSD |
| `jenv/` | Java env | GPL |
| `kyua/` | Test framework | BSD |
| `nvi/` | VI editor | BSD |
| `openbsm/` | BSM audit | BSD |

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

### Misc CDDL

| Component | Description |
|-----------|-------------|
| `devd/` | Device daemon |
| `libdevinfo/` | Device info |

---

## gnu/ — GPL/LGPL Software

**Path:** `gnu/`

### GNU Core Utils

| Package | Description | License |
|---------|-------------|---------|
| `binutils/` | GNU binutils | GPL |
| `diff/` | diffutils | GPL |
| `find/` | findutils | GPL |
| `grep/` | grep | GPL |
| `gzip/` | gzip | GPL |
| `patch/` | patch | GPL |
| `sed/` | sed | GPL |
| `tar/` | tar | GPL |
| `textutils/` | textutils | GPL |

### Tool Chain

| Package | Description | License |
|---------|-------------|---------|
| `gcc/` | GCC | GPL |

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
| `libecc/` | Elliptic curve |

### OpenSSH

| Component | Description |
|-----------|-------------|
| `openssh/` | OpenSSH |

### Documentation

| File | Description |
|------|-------------|
| `README` | Cryptographic notices |
| `openssl/README` | OpenSSL info |
| `openssh/LICENCE` | OpenSSH license |

---

## License Summary

| License | Packages |
|---------|----------|
| BSD | Most contrib |
| GPL | GNU tools, grep, gzip, etc. |
| LGPL | dialog, libiconv |
| CDDL | DTrace, ZFS |
| Apache 2.0 | LLVM/Clang |
| MIT | lyaml |
| Public Domain | sqlite3, xz |

---

## Third-Party Directory Tree

```
contrib/
├── atf/                    # Automated testing
├── bc/                     # BC calculator
├── binutils/               # Binary utilities
├── bsnmp/                 # SNMP
├── bzip2/                  # Compression
├── dialog/                 # Dialog
├── elftoolchain/           # ELF tools
├── expat/                  # XML parser
├── file/                   # File detection
├── flex/                   # Lexer
├── googletest/             # Testing
├── ldns/                   # DNS
├── less/                   # Pager
├── libarchive/             # Archives
├── libedit/                # Edit
├── libevent/               # Events
├── libpcap/                # Packet capture
├── libucl/                 # Config
├── libxo/                  # Output
├── libyaml/               # YAML
├── llvm-project/           # LLVM/Clang
├── lua/                    # Lua
├── mandoc/                 # Man pages
├── mtree/                  # mtree
├── netcat/                 # Netcat
├── ntp/                    # NTP
├── nvi/                    # VI editor
├── openbsm/                # BSM
├── openpam/                # PAM
├── openresolv/             # Resolver
├── pf/                     # PF firewall
├── pkgconf/                # Pkg-config
├── sendmail/               # Sendmail
├── smbfs/                  # SMB
├── sqlite3/                # SQLite
├── tcpdump/                # TCPDump
├── tcp_wrappers/           # TCP wrappers
├── tcsh/                   # TC Shell
├── telnet/                 # Telnet
├── tnftp/                  # FTP
├── tzcode/                  # Timezone
├── tzdata/                  # Timezone data
├── unbound/                 # DNS
├── vis/                    # Vis
├── wireguard-tools/        # WireGuard
└── wpa/                    # WPA

cddl/
├── devd/
├── dtrace/
├── libdtrace/
├── libdevinfo/
└── zfs/

gnu/
├── binutils/
├── diff/
├── find/
├── gcc/
├── grep/
├── gzip/
├── libstdc++/
├── patch/
├── sed/
├── tar/
└── textutils/

crypto/
├── heimdal/
├── krb5/
├── libecc/
└── openssh/
```

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