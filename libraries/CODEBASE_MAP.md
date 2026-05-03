# Libraries — Codebase Map

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
| `libc_nonshared/` | Non-shared libc objects |
| `libc++/` | C++ standard library |
| `libc++experimental/` | Experimental C++ |
| `libcompiler_rt/` | Compiler runtime |
| `libgcc_eh/` | GCC exception handling |
| `libgcc_s/` | GCC runtime |
| `libssp/` | Stack protector |
| `libssp_nonshared/` | Non-shared SSP |
| `libstdthreads/` | C++ threads |

### Filesystem & Disk

| Library | Description |
|---------|-------------|
| `libarchive/` | Archive handling (tar, zip) |
| `libbsddialog/` | BSD dialog |
| `libdialog/` | Dialog library |
| `libdisk/` | Disk label |
| `libfdt/` | Flattened Device Tree |
| `libfs/` | Filesystem operations |
| `libgeom/` | GEOM framework |
| `libufs/` | UFS library |
| `libz/` | Compression (zlib) |
| `libzstd/` | Zstandard compression |
| `libbz2/` | BZIP2 compression |
| `liblzma/` | LZMA compression |
| `libxz/` | XZ compression |
| `libmd/` | Message digest |
| `libmagic/` | File type detection |

### Networking

| Library | Description |
|---------|-------------|
| `libalias/` | IP alias/NAT |
| `libipsec/` | IPsec |
| `libipf/` | IP filter |
| `libpcap/` | Packet capture |
| `libnetgraph/` | Netgraph |
| `libnetmap/` | Netmap |
| `librpc/` | RPC/XDR |
| `librpcsvc/` | RPC services |
| `librpcsec_gss/` | GSSAPI RPC |
| `libsocket/` | Socket wrapper |
| `libssl/` | OpenSSL (in secure/) |
| `libssh/` | SSH (in secure/) |
| `libwrap/` | TCP wrappers |

### Security & Authentication

| Library | Description |
|---------|-------------|
| `libpam/` | Pluggable Auth Modules |
| `libbsm/` | BSM audit |
| `libcrypto/` | Crypto (OpenSSL) |
| `libssl/` | SSL/TLS |
| `libssh/` | SSH protocol |
| `libgssapi/` | GSSAPI |
| `libkrb5/` | Kerberos 5 |
| `libheimdal/` | Heimdal Kerberos |
| `libcap/` | Capabilities |
| `libmac/` | Mandatory Access Control |
| `libprivatest/` | Private storage |
| `libucl/` | UCL config |

### System & Process

| Library | Description |
|---------|-------------|
| `libbluetooth/` | Bluetooth |
| `libcbor/` | CBOR |
| `libcuse/` | Character device |
| `libdbus/` | D-Bus |
| `libdevinfo/` | Device info |
| `libdevstat/` | Device statistics |
| `libdwarf/` | DWARF debug |
| `libedit/` | Line edit |
| `libelf/` | ELF handling |
| `libelftc/` | ELF Tool Chain |
| `libevent/` | Event loop |
| `libexecinfo/` | Exec info |
| `libproc/` | Process info |
| `libprocstat/` | Process stats |
| `libkvm/` | Kernel VM |
| `libmemstat/` | Memory stats |
| `libthr/` | Thread |
| `libthread_db/` | Thread debug |
| `libumem/` | Memory allocator |
| `libutil/` | Utilities |
| `libxo/` | Text output |

### Data Structures

| Library | Description |
|---------|-------------|
| `libarm/` | ARM |
| `libbegemot/` | Begemot lib |
| `libcom_err/` | Error library |
| `libunicode/` | Unicode |
| `libugidfw/` | User/group FW |
| `libulog/` | ULOG |
| `libulog/` | User log |

### Serial & Terminal

| Library | Description |
|---------|-------------|
| `libncurses/` | ncurses terminal |
| `libtty/` | TTY operations |
| `libterm/` | Terminal |
| `libvgl/` | Virtual GL |

### Audio & Video

| Library | Description |
|---------|-------------|
| `libaudio/` | Audio |
| `libmixer/` | Audio mixer |
| `libsound/` | Sound |
| `virtual_oss/` | Virtual OSS |

### Hardware & Drivers

| Library | Description |
|---------|-------------|
| `libacpi/` | ACPI |
| `libata/` | ATA/SATA |
| `libcam/` | CAM SCSI |
| `libcapsicum/` | Capsicum |
| `libgpio/` | GPIO |
| `libiicbus/` | I2C bus |
| `libio/` | I/O library |
| `libnvmf/` | NVMe over Fabrics |
| `libpfi/` | PF (packet filter) |
| `libusb/` | USB |
| `libusbhid/` | USB HID |
| `libpci/` | PCI |

### FreeBSD-Specific

| Library | Description |
|---------|-------------|
| `libjail/` | Jail framework |
| `libsys/` | System calls |
| `libsysdecode/` | Syscall decode |
| `librtld_db/` | Runtime linker |
| `libkldelf/` | KLDelf |
| `libkiconv/` | Iconv charset |
| `libcalendar/` | Calendar |
| `libsbuf/` | String buffer |
| `libnv/` | NVRAM |

### Graphics & GPU

| Library | Description |
|---------|-------------|
| `libdrm/` | Direct Render Manager |
| `libgpu/` | GPU support |

### Testing

| Library | Description |
|---------|-------------|
| `libatf/` | ATF testing |
| `libgoogletest/` | Google Test |
| `libblocksruntime/` | Blocks runtime |

### Build System

| Library | Description |
|---------|-------------|
| `libcsu/` | C startup |
| `libclangtest/` | Clang test |
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
| `rbootd/` | RBoot daemon |
| `rlogind/` | RLogin daemon |
| `rshd/` | RSH daemon |
| `talkd/` | Talk daemon |
| `telnetd/` | Telnet daemon |
| `tftpd/` | TFTP server |
| `ypxfr/` | YP transfer |

### System Helpers

| Program | Description |
|---------|-------------|
| `atrun/` | At scheduler |
| `blocklistd-helper/` | Blocklist helper |
| `flua/` | Flua helper |
| `makewhatis.local/` | Whatis update |
| `mknetid/` | Net ID maker |
| `pkg-serve/` | Package server |
| `save-entropy/` | Entropy saver |
| `smrsh/` | Sendmail restricted shell |
| `ulog-helper/` | ULOG helper |

### RPC Services

| Program | Description |
|---------|-------------|
| `rpc.rquotad/` | NFS quota |
| `rpc.rstatd/` | RStat |
| `rpc.rusersd/` | RUsers |
| `rpc.rwalld/` | RWall |
| `rpc.sprayd/` | Spray |
| `rpc.umntall/` | Unmount all |

### Mail

| Program | Description |
|---------|-------------|
| `mail.local/` | Local mail delivery |

### DMA Mail

| Program | Description |
|---------|-------------|
| `dma/` | DragonFly Mail Agent |

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
| `lib/` | Cryptographic libraries |
| `lib/libcrypto/` | OpenSSL libcrypto |
| `lib/libssl/` | OpenSSL libssl |

### Commands

| Command | Description |
|---------|-------------|
| `usr.bin/` | Cryptographic utilities |
| `usr.sbin/` | Admin tools |

### Structure

```
secure/
├── caroot/              # CA root certificates
├── lib/                # Libraries
│   ├── libcrypto/      # OpenSSL crypto
│   └── libssl/         # OpenSSL SSL/TLS
├── libexec/            # Helper programs
├── Makefile
├── Makefile.inc
├── ssh.mk              # SSH makefile
├── tests/              # Tests
├── usr.bin/            # Commands
│   ├── openssl/        # OpenSSL command
│   └── ssh/            # SSH tools
└── usr.sbin/           # Admin commands
```

### OpenSSL Components

- `crypto/` — Cryptographic primitives
- `ssl/` — SSL/TLS protocols
- `tls/` — TLS utilities

### SSH Components

- `ssh/` — SSH client/server
- `sshd/` — SSH daemon

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