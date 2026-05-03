# usr.sbin/ — System Administration Commands Codebase Map

**Path:** `usr.sbin/`
**Purpose:** System administration commands (236 commands)

## Overview

The usr.sbin directory contains system administration and configuration commands.

## Network Administration

| Command | Purpose |
|---------|---------|
| `arp` | ARP table management |
| `atm/` | ATM utilities |
| `bootparamd` | Boot params daemon |
| `bridge` | Bridge management |
| `btxld` | BTX loader |
| `chgkbd` | Change keyboard |
| `devd` | Device daemon |
| `devfs` | Device FS management |
| `dhclient` | DHCP client |
| `dhcp*` | DHCP related |
| `dnssec*` | DNSSEC tools |
| `firewire/` | FireWire support |
| `inetd` | Internet daemon |
| `ip6addrctl` | IPv6 address policy |
| `ipfw` | IP firewall |
| `ipfwpfil` | IPFW pfil |
| `iscsi*` | iSCSI tools |
| `kadmind` | Kerberos admin |
| `kdc` | Kerberos KDC |
| `kpasswdd` | Kerberos password |
| `linkstad` | Link state daemon |
| `named*` | DNS server |
| `natd` | NAT daemon |
| `ndisc6` | IPv6 neighbor disc |
| `pf*` | Packet filter |
| `ppp*` | PPP dialer |
| `racoon` | IPsec key exchange |
| `routed` | Routing daemon |
| `rpc.*` | RPC services |
| `rtadvd` | IPv6 router adv |
| `rtquery` | Routing query |
| `rtsold` | IPv6 router sol |
| `setkey` | IPsec key |
| `sliplogin` | SLIP login |
| `smbutil` | SMB client |
| `snmp*` | SNMP tools |
| `sppp` | Sync PPP |
| `sshd` | SSH daemon |
| `tcpd*` | TCP wrappers |
| `traceroute6` | IPv6 traceroute |

## Disk & Filesystem

| Command | Purpose |
|---------|---------|
| `atm/` | ATM utilities |
| `badsect` | Bad sector handling |
| `boot0cfg` | Boot manager |
| `bsdlabel` | Disk label |
| `camcontrol` | CAM control |
| `ccdconfig` | Concatenated disk |
| `clri` | Clear inode |
| `comcontrol` | Serial control |
| `conscontrol` | Console control |
| `cryptsetup` | Disk encryption |
| `device` | Device utility |
| `devinfo` | Device info |
| `devmatch` | Device match |
| `dumpon` | Crash dump |
| `dumpfs` | Dump FS |
| `ext2fs/` | ext2fs tools |
| `fdisk` | Partition editor |
| `fsck*` | Filesystem check |
| `gbde` | GEOM based disk enc |
| `gconcat` | GEOM concat |
| `geom` | GEOM utility |
| `gmirror` | GEOM mirror |
| `gmultiply` | GEOM multiply |
| `graid` | GEOM RAID |
| `graid3` | GEOM RAID3 |
| `gstripe` | GEOM stripe |
| `gtemplate` | GEOM template |
| `hastd` | HA storage |
| `initrd` | Initrd tools |
| `iruserd` | IRC user |
| `iscsitarget` | iSCSI target |
| `jail` | Jail management |
| `ldconfig` | Library config |
| `lmc*` | LOM/CVIS |
| `makefs` | Make filesystem |
| `mdconfig` | Memory disk |
| `mdmfs` | Memory disk FS |
| `mfi*` | MFI RAID |
| `mlx*` | MPT RAID |
| `mps*` | mps RAID |
| `mpt*` | MPT RAID |
| `nfs*` | NFS tools |
| `pciconf` | PCI config |
| `pcitest` | PCI test |
| `raid*` | RAID tools |
| `restore` | Restore dump |
| `routed` | Routing daemon |
| `rrdtool` | Round-robin DB |
| `savecore` | Save crash dump |
| `scu` | CAM SCSI util |
| `ses` | SES enclosure |
| `smartd` | SMART daemon |
| `smartctl` | SMART control |
| `spkr` | Speaker |
| `stf` | 6to4 relay |
| `swap*` | Swap utilities |
| `syscons` | Syscons control |
| `tail` | Tail file |
| `timed` | Time daemon |
| `ttyflags` | TTY flags |
| `umount` | Unmount |
| `vidcontrol` | Video control |
| `vigr` | Edit group |
| `vipw` | Edit password |
| `watchdog*` | Watchdog |
| `wicontrol` | Wireless |

## User & Group Management

| Command | Purpose |
|---------|---------|
| `adduser` | Add user |
| `rmuser` | Remove user |
| `chpass` | Change passwd |
| `chfn` | Change full name |
| `chsh` | Change shell |
| `finger` | Finger info |
| `groups` | Show groups |
| `pwd_mkdb` | Password DB |
| `quota` | Quota command |
| `quotacheck` | Quota check |
| `quotaon` | Enable quotas |
| `quotaoff` | Disable quotas |
| `edquota` | Edit quota |
| `repquota` | Report quota |

## System Control

| Command | Purpose |
|---------|---------|
| `acpi*` | ACPI tools |
| `apm` | APM control |
| `apmd` | APM daemon |
| `audit*` | Audit tools |
| `blacklist*` | Blacklist |
| `bhyve*` | BHyve hypervisor |
| `bsnmp*` | SNMP tools |
| `ctl*` | CAM Target Layer |
| `dbus*` | D-Bus |
| `devd` | Device daemon |
| `devfs*` | Devfs control |
| `kenv` | Kernel env |
| `kld*` | Kernel modules |
| `powerd*` | Power daemon |
| `sched*` | Scheduler |
| `sysctl` | Sysctl |
| `zfs*` | ZFS commands |

## Installation & Updates

| Command | Purpose |
|---------|---------|
| `bsdinstall` | FreeBSD installer |
| `bsdconfig` | Configuration |
| `bsdlabel` | Disk label |
| `sysinstall` | System install |

## See Also

- `sbin/` - Essential system admin
- `usr.bin/` - User commands