# sys/ — Kernel Sources Codebase Map

**Path:** `sys/`
**Source:** FreeBSD kernel sources

## Overview

The `sys/` directory contains the kernel sources for FreeBSD. This is the core of the FreeBSD operating system including core kernel code, device drivers, filesystem implementations, and networking stack.

## Directory Tree

```
sys/
├── amd64/              # AMD64 (x86-64) architecture
├── arm/                # ARM (32-bit) architecture
├── arm64/              # ARM64 (AArch64) architecture
├── bsm/                # BSM (Basic Security Module) audit
├── cam/                # CAM (Common Access Method) SCSI
├── cddl/               # CDDL-licensed code
├── compat/             # Compatibility layers
├── conf/               # Kernel configuration
├── contrib/            # Third-party kernel code
├── crypto/             # Cryptographic framework
├── ddb/                # DDB kernel debugger
├── dev/                # Device drivers
├── dts/                # Device Tree files
├── fs/                 # Filesystem implementations
├── gdb/                # GDB support
├── geom/               # GEOM framework
├── gnu/                # GPL/LGPL code
├── i386/               # i386 (32-bit x86) architecture
├── isa/                 # ISA bus support
├── kern/               # Core kernel
├── kgssapi/            # GSSAPI kernel support
├── libkern/            # Kernel library (architecture-independent)
├── modules/            # Loadable kernel modules
├── net/                # Network generic
├── net80211/           # 802.11 wireless networking
├── netgraph/           # Netgraph networking
├── netinet/            # IPv4 networking
├── netinet6/           # IPv6 networking
├── netipsec/           # IPsec networking
├── netlink/            # Netlink sockets
├── netpfil/            # Packet filtering (pf)
├── netsmb/             # SMB networking
├── nfs/                # NFS (client/server shared)
├── nfsclient/          # NFS client
├── nfsserver/          # NFS server
├── nlm/                # Network Lock Manager
├── ofed/               # InfiniBand/OFED
├── opencrypto/         # OpenCryptographic framework
├── powerpc/            # PowerPC architecture
├── README.md           # Kernel README
├── riscv/              # RISC-V architecture
├── rpc/                # RPC/XDR
├── security/           # Security modules
├── sys/                # Kernel internal headers
├── teken/              # Terminal emulator
├── tests/              # Kernel tests
├── tools/              # Kernel tools
├── ufs/                # UFS filesystem
├── vm/                 # Virtual memory
├── x86/                # x86 (common 32/64-bit)
├── xdr/                # XDR marshalling
└── xen/                # Xen support
```

## Architecture-Specific Directories

| Directory | Architecture | Notes |
|-----------|-------------|-------|
| `amd64/` | AMD64 (x86-64) | Primary server/desktop |
| `i386/` | i386 (32-bit x86) | Legacy |
| `arm/` | ARM (32-bit) | Embedded |
| `arm64/` | ARM64 (AArch64) | ARM servers |
| `powerpc/` | PowerPC | Legacy |
| `riscv/` | RISC-V | Embedded/servers |
| `x86/` | x86 shared | Common 32/64-bit code |

## Core Kernel Subsystems

### kern/ — Core Kernel

Core kernel functionality including:
- `kern_init.c` — Kernel initialization
- `kern_sysctl.c` — Sysctl interface
- `kern_time.c` — Time management
- `kern_uio.c` — I/O operations
- `vfs_subsimples.c` — VFS simple operations

### vm/ — Virtual Memory

Virtual memory subsystem:
- `vm_page.c` — Page management
- `vm_map.c` — Address space maps
- `vm_object.c` — VM objects
- `vm_pager.c` — Pager interface

### netinet/ — IPv4 Stack

IPv4 networking:
- `in_proto.c` — IP protocol switch
- `ip_input.c` — IP input processing
- `ip_output.c` — IP output processing
- `tcp_input.c` — TCP input
- `udp_usrreq.c` — UDP requests

### netinet6/ — IPv6 Stack

IPv6 networking:
- `ip6_input.c` — IPv6 input
- `ip6_output.c` — IPv6 output
- `tcp6_input.c` — TCP for IPv6

## Filesystem Layer (fs/)

```
fs/
├── compat/             # Filesystem compatibility
├── ext2fs/            # ext2/ext3 filesystem
├── fifofs/            # FIFO/fifo filesystem
├── msdosfs/            # FAT/MSDOS filesystem
├── nfs/               # NFS shared (see also nfsclient/, nfsserver/)
├── nullfs/            # Null filesystem
├── overlayfs/         # Overlay filesystem
├── procfs/            # Process filesystem
├── tmpfs/             # TMP filesystem
└── udf/               # UDF filesystem
```

### ufs/ — UFS Filesystem

```
ufs/
├── ufs/
│   ├── ufs_alloc.c    # Block allocation
│   ├── ufs_bmap.c     # Block mapping
│   ├── ufs_inode.c    # Inode operations
│   ├── ufs_lookup.c   # Name lookup
│   └── ufs_vnops.c    # VFS operations
├── ffs/               # Fast Filesystem
│   ├── ffs_softdep.c  # Soft updates
│   ├── ffs_vfsops.c   # FFS VFS operations
│   └── ffs_vnops.c    # FFS vnode operations
└── ufs/
```

## Device Drivers (dev/)

```
dev/
├── ahci/              # AHCI SATA driver
├── bxe/               # Broadcom BCM5771X
├── cxgb/              # Chelsio T4/T5
├── dc/                # DEC DC21x4x Ethernet
├── ed/                # NE2000 Ethernet
├── em/                # Intel EM64T Ethernet
├── iicbus/            # I2C bus
├── ieee80211/         # 802.11 common
├── ixgbe/             # Intel 82599 Ethernet
├── ixl/               # Intel XL710 Ethernet
├── mlx5/              # Mellanox ConnectX
├── mxser/             # MOXA serial
├── nvidia/            # NVIDIA GPU (binary blob)
├── ofw/               # Open Firmware
├── pci/               # PCI bus
├── psynth/            # Pseudo synth
├── rtc/               # Real-time clock
├── sdhci/             # SD Host Controller
├── sdhci/             # SDHCI driver
├── siis/              # Silicon Image SATA
├── smbios/            # SMBIOS
├── spi/               # SPI bus
├── ti/                # Texas Instruments
├── twitter/           # Twitter-specific
├── uart/              # UART serial
├── usb/               # USB stack
├── vge/               # VIA VT612x Ethernet
├── virtio/            # VirtIO drivers
├── vmware/            # VMware support
├── xen/               # Xen support
└── xl/                # 3Com Etherlink XL
```

## Networking (net/, netinet/, netgraph/)

### net/ — Generic Networking

- `if.c` — Network interface management
- `if_arc.c` — ARCnet
- `if_atm.c` — ATM
- `if_bridge.c` — Bridge
- `if_gif.c` — GIF tunnel
- `if_tap.c` — TAP/TUN
- `if_vlan.c` — VLAN

### netgraph/ — Netgraph

Modular networking framework:
- `netgraph.h` — Netgraph header
- `node/ — Node implementations
- `socket/ — Socket operations
- `tcp/ — TCP netgraph

## GEOM Framework (geom/)

Modular disk framework:
- `geom_bsd.c` — BSD partitioning
- `geom_ccd.c` — Concatenated disks
- `geom_gate.c` — Gate device
- `geom_label.c` — Disk labeling
- `geom_mbr.c` — MBR partitioning
- `geom_nop.c` — No-op geom
- `geom_part.c` — Partitioning
- `geom_raid3.c` — RAID3
- `geom_shsec.c` — Shell secrets
- `geom_stripe.c` — Striping
- `geom_sunlabel.c` — Sun labeling
- `geom_uzip.c` — Uzip compression
- `geom_vinum.c` — Vinum RAID

## Kernel Configuration (conf/)

- `NOTES` — Full kernel options documentation
- `GENERIC` — Default/generic kernel config
- `device.hints` — Device hints

## Loadable Kernel Modules (modules/)

Organized by subsystem:
```
modules/
├── accf/              # Accept filters
├── accf_httpd/
├── amd/               # AutoMount daemon
├── apm/
├── acpi/
├── audit/
├── bhnd/
├── bpf/               # Berkeley Packet Filter
├── bus/               # Bus modules
├── ccd/
├── crypto/            # Cryptographic modules
├── dtrace/
├── ext2fs/
├── fdescfs/
├── firewire/          # IEEE 1394
├── geom/              # GEOM modules
├── i2c/
├── icmp/
├── ichsmb/
├── if_/               # Network drivers
├── ip_divert/
├── ipfw/
├── ipmi/
├── ipsec/
├── iscsi/
├── jail/
├── linux/
├── mac/               # Mandatory Access Control
├── msdosfs/
├── nfsd/
├── ng_/               # Netgraph nodes
├── nullfs/
├── nwfs/
├── opensolaris/
├── overlayfs/
├── pcmcia/
├── pf/                # Packet Filter
├── procfs/
├── pseudofs/
├── race/
├── sch_netgraph/
├── sd/
├── sdp/
├── sdhci/
├── sppp/
├── sym/
├── sysvipc/
├── tmpfs/
├── udf/
├── ulpt/
├── ums/
├── uipc_socket/
├── usb/               # USB drivers
├── uvscom/
├── vfs/
├── virtio/            # VirtIO drivers
├── vmware/
├── vnode_if.c         # Vnode interface
├── vesa/
├── wlan/              # Wireless LAN
├── xen/
└── zfs/
```

## Kernel Build System

```bash
# Build kernel
make buildkernel KERNCONF=GENERIC

# Install kernel
make installkernel KERNCONF=GENERIC

# Build single module
cd sys/modules/acpi && make
```

## Key Kernel Headers

| Header | Purpose |
|--------|---------|
| `sys/types.h` | Basic types |
| `sys/systm.h` | Kernel internal |
| `sys/kernel.h` | Kernel startup |
| `sys/proc.h` | Process management |
| `sys/vnode.h` | VFS vnode |
| `sys/file.h` | File operations |
| `sys/socket.h` | Socket interface |
| `sys/malloc.h` | Memory allocation |
| `sys/lock.h` | Locking primitives |
| `sys/mutex.h` | Mutex operations |