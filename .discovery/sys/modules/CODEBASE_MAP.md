# sys/modules/ — Loadable Kernel Modules Codebase Map

**Path:** `sys/modules/`
**Files:** 478 module directories
**Purpose:** Build system for loadable kernel modules

## Overview

The modules/ directory contains Makefiles and metadata for building loadable kernel modules (KLDs). Each subdirectory builds one kernel module.

## Module Categories

### Filesystem Modules

| Module | Description |
|--------|-------------|
| ext2fs | ext2/ext3/ext4 filesystem |
| msdosfs | FAT filesystem |
| udf | UDF DVD filesystem |
| cd9660 | ISO9660 CD-ROM |
| nfsclient | NFS client |
| nfsd | NFS server |
| smbfs | SMB/CIFS client |
| tmpfs | Memory filesystem |
| unionfs | Union filesystem |
| nullfs | Null filesystem |
| procfs | Process filesystem |
| devfs | Device filesystem |
| fdescfs | File descriptor filesystem |

### Network Protocol Modules

| Module | Description |
|--------|-------------|
| accf_data | Accept filter - data |
| accf_dns | Accept filter - DNS |
| accf_http | Accept filter - HTTP |
| accf_tls | Accept filter - TLS |
| firewall | IPFW firewall |
| ipfw | IP firewall |
| pf | Packet Filter |
| pflog | PF logging |
| pfsync | PF state sync |
| ipfw_nat | IPFW NAT |
| dummynet | Traffic shaper |

### Network Interface Modules

| Module | Description |
|--------|-------------|
| ae | Attansic Ethernet |
| age | Agere Ethernet |
| ale | Atheros L1E |
| alc | Atheros AR8131/8152 |
| amdsmn | AMD SMBus |
| ath | Atheros 802.11 |
| ath_hal | Atheros HAL |
| ath_rate | Atheros rate control |
| bce | Broadcom NetXtreme |
| bfe | Broadcom 440x |
| bge | Broadcom 570x |
| bnxt | Broadcom Nextreme |
| cas | Cardinal Ethernet |
| cxgbe | Chelsio T4/T5 |
| em | Intel 8254x |
| et | Epic Ethernet |
| igc | Intel 2.5G |
| ixgbe | Intel 10GbE |
| ixl | Intel 40GbE |
| jme | JMicron Ethernet |
| le | AMD PCnet |
| lem | Intel 82543 |
| msk | Marvell Yukon |
| mxge | Myricom 10GbE |
| nfe | NVIDIA nForce |
| ngbe | Nextreme 10GbE |
| pcnet | AMD PCnet |
| re | Realtek 8139/8169 |
| rl | Realtek 8029 |
| sf | Seeq Ethernet |
| sis | Silicon Integrated Systems |
| sk | SysKonnect SK-98xx |
| ste | Sundance ST-201 |
| stge | Sundance Tech |
| ti | Texas Instruments |
| txp | 3Com 3c985 |
| udav | ASIX USB |
| vge | VIA VT612x |
| vr | VIA Rhine |
| xl | 3Com 905c |

### Wireless Modules

| Module | Description |
|--------|-------------|
| ath | Atheros 802.11 |
| ath_hal | Atheros hardware |
| ath_rate | Rate control |
| ath10k | Atheros 10k |
| ath11k | Atheros 11k |
| bwi | Broadcom Wi-Fi |
| bwn | Broadcom Nano |
| iwn | Intel 802.11n |
| iwm | Intel 802.11ac |
| iwmc | Intel Wi-Fi MVM |
| malo | Marvell Libertas |
| mwlu | MediaTek |
| otus | Atheros OTUS |
| pci | PCI wireless |
| ral | Ralink |
| rtwn | Realtek RTL8188 |
| rum | Ralink USB |
| run | Ralink USB |
| uath | Atheros USB |
| ural | Ralink USB |
| urtw | Realtek USB |
| wi | WaveLAN |
| wpi | Intel 4965 |
| zyd | Zydas ZD1211 |

### Virtualization Modules

| Module | Description |
|--------|-------------|
| vmm | BHyV hypervisor |
| virtio | VirtIO para-virtual |
| virtio_blk | VirtIO block |
| virtio_balloon | VirtIO balloon |
| virtio_console | VirtIO console |
| virtio_gpu | VirtIO GPU |
| virtio_scsi | VirtIO SCSI |
| hyperv | Hyper-V drivers |
| vmware | VMware guest |

### SCSI/CAM Modules

| Module | Description |
|--------|-------------|
| aac | Adaptec RAID |
| aacraid | Adaptec RAID |
| ahci | AHCI SATA |
| aic7xxx | Adaptec SCSI |
| arcmsr | Areca RAID |
| ciss | HP Smart Array |
| da | SCSI disk |
| isp | QLogic FC |
| mrsas | LSI MegaRAID |
| mps | LSI SAS |
| mpt | LSI SCSI |
| siis | Silicon Image SATA |
| smartpqi | HPE Smart |
| twa | 3ware RAID |
| tws | LSI SAS |

### Crypto Modules

| Module | Description |
|--------|-------------|
| aesni | Intel AES-NI |
| armv8crypto | ARMv8 crypto |
| ccp | AMD CCP |
| cryptodev | /dev/crypto |
| hifn | HiFn 795x |
| padlock | VIA PadLock |
| safe | SafeNet |
| ubsec | Broadcom |
| vmware_balloon | VirtIO balloon |

### Sound Modules

| Module | Description |
|--------|-------------|
| sound | Sound driver |
| ichss | Intel HD Audio |
| ichsd | Intel SD Card |
| ichsmb | Intel SMBus |
| csa | CS4281 |
| emu10k1 | SB Live! |
| snd_ad1816 | AD1816 |
| snd_als4000 | ALS4000 |
| uaudio | USB audio |

### Input Modules

| Module | Description |
|--------|-------------|
| atkbdc | AT keyboard |
| atkbd | AT keyboard |
| psm | PS/2 mouse |
| ukbd | USB keyboard |
| ums | USB mouse |
| kbdmux | Keyboard mux |

### ACPI/APM Modules

| Module | Description |
|--------|-------------|
| acpi | ACPI |
| acpi_asus | ASUS ACPI |
| acpi_dock | ACPI docking |
| acpi_fujitsu | Fujitsu |
| acpi_hp | HP ACPI |
| acpi_ibm | IBM ACPI |
| acpi_panasonic | Panasonic |
| acpi_sony | Sony |
| acpi_toshiba | Toshiba |
| acpi_video | ACPI video |
| apm | APM (legacy) |

### Terminal/Console Modules

| Module | Description |
|--------|-------------|
| vt | Virtual terminal |
| fb | Framebuffer |
| splash | Splash screen |
| splash_vt | Splash VT |
| vga | VGA console |

### Utility Modules

| Module | Description |
|--------|-------------|
| ulpt | USB printer |
| umct | USB modem |
| uplcom | USB serial |
| uslcom | USB serial |
| uhid | USB HID |
| umass | USB storage |
| ums | USB mouse |
| urio | Diamond Rio |

### Kernel Extension Modules

| Module | Description |
|--------|-------------|
| linux | Linux emulation |
| linux64 | Linux 64-bit |
| freebsd32 | FreeBSD32 |
| mac | MAC framework |
| audit | Audit |
| capsicum | Capsicum sandbox |
| dtrace | DTrace |

### NAND/Flash Modules

| Module | Description |
|--------|-------------|
| nand | NAND flash |
| g_nand | GEOM NAND |
| ffs | FFS filesystem |

## Module Build System

Each module directory contains:

```makefile
# Makefile
KMOD    = foo
SRCS    = foo.c bar.c
.PATH   : ${SRCTOP}/sys/foo

.include <bsd.kmod.mk>
```

## Loading/Unloading Modules

```bash
# Load module
kldload foo

# Unload module
kldunload foo

# List loaded modules
kldstat

# Auto-load at boot
# Add to /boot/loader.conf
foo_load="YES"
```

## Module Dependencies

```bash
# Show dependencies
kldstat -v
```

## Module Path

```
/boot/kernel/           - Production modules
/boot/modules/          - Third-party modules
```

## See Also

- `sys/kern/kern_kld.c` - KLD system calls
- `sys/kern/kmod.c` - Kernel module support