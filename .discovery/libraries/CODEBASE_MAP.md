# libraries/ — Libraries Codebase Map

**Path:** `lib/`, `libexec/`, `secure/`
**Total Libraries:** 157+ (lib), 38+ (libexec), 9+ (secure)

## Overview

The libraries directories contain system libraries, daemon executables, and cryptographic libraries used throughout FreeBSD.

---

## lib/ — System Libraries

**Path:** `lib/`
**Count:** 157 libraries

### Core C Library

| Library | Description |
|---------|-------------|
| `libc/` | C standard library |
| `libc++/` | C++ standard library |
| `libgcc_s/` | GCC runtime |
| `libssp/` | Stack protector |
| `libstdthreads/` | C++ threads |

### Filesystem & Disk

| Library | Description |
|---------|-------------|
| `libarchive/` | Archive handling (tar, zip) |
| `libgeom/` | GEOM framework |
| `libufs/` | UFS library |
| `libz/` | Compression (zlib) |
| `libzstd/` | Zstandard compression |
| `libmd/` | Message digest |
| `libmagic/` | File type detection |

### Networking

| Library | Description |
|---------|-------------|
| `libalias/` | IP alias/NAT |
| `libipsec/` | IPsec |
| `libpcap/` | Packet capture |
| `libnetgraph/` | Netgraph |
| `librpc/` | RPC/XDR |
| `libwrap/` | TCP wrappers |

### Security & Authentication

| Library | Description |
|---------|-------------|
| `libpam/` | Pluggable Auth Modules |
| `libbsm/` | BSM audit |
| `libcrypto/` | Crypto (OpenSSL) |
| `libssl/` | SSL/TLS |
| `libgssapi/` | GSSAPI |
| `libcap/` | Capabilities |

### System & Process

| Library | Description |
|---------|-------------|
| `libbluetooth/` | Bluetooth |
| `libcbor/` | CBOR |
| `libedit/` | Line edit |
| `libelf/` | ELF handling |
| `libevent/` | Event loop |
| `libproc/` | Process info |
| `libthr/` | Thread |
| `libutil/` | Utilities |

### Hardware & Drivers

| Library | Description |
|---------|-------------|
| `libcam/` | CAM SCSI |
| `libcapsicum/` | Capsicum |
| `libgpio/` | GPIO |
| `libpci/` | PCI |
| `libusb/` | USB |

### Build System

| Library | Description |
|---------|-------------|
| `libcsu/` | C startup |
| `lib/msun/` | Math library |

---

## libexec/ — System Daemons & Helpers

**Path:** `libexec/`
**Purpose:** Programs executed by other programs

### Network Daemons

| Program | Description |
|---------|-------------|
| `bootpd/` | BOOTP server |
| `fingerd/` | Finger daemon |
| `ftpd/` | FTP server |
| `getty/` | Getty |
| `pppoed/` | PPPoE server |
| `talkd/` | Talk daemon |
| `telnetd/` | Telnet daemon |
| `tftpd/` | TFTP server |

### Runtime

| Program | Description |
|---------|-------------|
| `rtld-elf/` | Dynamic linker |
| `rtld-elf32/` | 32-bit linker |

---

## secure/ — Cryptographic Libraries

**Path:** `secure/`

### Libraries

| Library | Description |
|---------|-------------|
| `lib/libcrypto/` | OpenSSL libcrypto |
| `lib/libssl/` | OpenSSL libssl |

### Structure

```
secure/
├── caroot/              # CA root certificates
├── lib/                 # Libraries
│   ├── libcrypto/      # OpenSSL crypto
│   └── libssl/         # OpenSSL SSL/TLS
├── usr.bin/            # Commands
│   ├── openssl/        # OpenSSL command
│   └── ssh/            # SSH tools
└── usr.sbin/           # Admin commands
```

---

## Build System

### Building Libraries

```bash
# Build single library
cd lib/libfoo && make

# Build all libraries
make buildworld
```

### Linking

Libraries are linked using:
- `-lfoo` for `libfoo`
- `-L/path/to/lib` for library path
- `-I/path/to/include` for headers

### Library Dependencies

Core library dependency order:
```
libc → libpthread → libm → libcrypto → libssl → libssh
```