# Userland Commands — Codebase Map

**Path:** `bin/`, `sbin/`, `usr.bin/`, `usr.sbin/`
**Total Commands:** 652 (44 + 90 + 282 + 236)

## Overview

The userland commands directories contain all the executable programs in FreeBSD. These are organized by function and privilege level.

## Directory Summary

| Directory | Description | Count |
|-----------|-------------|-------|
| `bin/` | Essential user commands | 44 |
| `sbin/` | System administration commands | 90 |
| `usr.bin/` | User commands | 282 |
| `usr.sbin/` | System administration commands | 236 |

---

## bin/ — Essential User Commands

**Path:** `bin/`
**Purpose:** Essential commands required for single-user mode

| Command | Description |
|---------|-------------|
| cat | Concatenate and display files |
| chflags | Change file flags |
| chio | Change I/O options |
| chmod | Change file modes |
| cp | Copy files |
| cpuset | Manage CPU sets |
| csh | C shell |
| date | Display date/time |
| dd | Data converter |
| df | Display filesystem usage |
| domainname | Set/get domain name |
| echo | Display text |
| ed | Line editor |
| expr | Evaluate expressions |
| freebsd-version | FreeBSD version |
| getfacl | Get ACL |
| hostname | Host name |
| kenv | Kernel environment |
| kill | Send signal |
| ln | Make links |
| ls | List directory |
| mkdir | Make directories |
| mv | Move files |
| nproc | Number of CPUs |
| pax | Archive utility |
| pkill | Signal processes |
| ps | Process status |
| pwait | Wait for process |
| pwd | Print working directory |
| realpath | Resolve path |
| rm | Remove files |
| rmail | Remote mail |
| rmdir | Remove directories |
| setfacl | Set ACL |
| sh | POSIX shell |
| sleep | Delay |
| stty | Set terminal |
| sync | Sync filesystems |
| test | Test condition |
| timeout | Run with timeout |
| uuidgen | Generate UUID |

---

## sbin/ — System Administration Commands

**Path:** `sbin/`
**Purpose:** Critical system administration commands

### Filesystem Commands

| Command | Description |
|---------|-------------|
| bsdlabel | Read/write disk label |
| camcontrol | CAM device control |
| ccdconfig | Concatenated disk config |
| clri | Clear inode |
| devd | Device state change daemon |
| devfs | Device filesystem |
| devmatch | Device matching |
| dump | Dump filesystem |
| dumpfs | Dump filesystem info |
| dumpon | Enable dump device |
| ffsinfo | FFS info |
| fsck_ffs | FFS filesystem check |
| fsck_msdosfs | FAT filesystem check |
| fsck | Generic fs check |
| fsdb | Filesystem debugger |
| fsirand | Randomize inode numbers |
| growfs | Grow filesystem |
| mdconfig | Memory disk config |
| mdmfs | Memory disk mount |
| mknod | Make device node |
| mksnap_ffs | Make snapshot |
| mount_cd9660 | Mount ISO9660 |
| mount_fusefs | Mount FUSE |
| mount_msdosfs | Mount FAT |
| mount_nfs | Mount NFS |
| mount_nullfs | Mount nullfs |
| mount_udf | Mount UDF |
| mount_unionfs | Mount unionfs |
| mount | Mount filesystem |
| newfs | New filesystem |
| newfs_msdos | New FAT filesystem |
| quotacheck | Quota check |
| recoverdisk | Recover disk |
| restore | Restore backup |
| tunefs | Tune filesystem |
| umount | Unmount |

### Network Commands

| Command | Description |
|---------|-------------|
| dhclient | DHCP client |
| etherswitchcfg | Ethernet switch config |
| ifconfig | Interface config |
| ipf | IP filter |
| ipfw | IP firewall |
| natd | NAT daemon |
| pfctl | Packet filter control |
| pflogd | PF logging daemon |
| pflowctl | Flow control |
| ping | Ping utility |
| route | Routing table |
| routed | Routing daemon |
| rtsol | IPv6 router solicitation |
| setkey | IPsec key control |

### Kernel Commands

| Command | Description |
|---------|-------------|
| kldconfig | KLD config |
| kldload | Load kernel module |
| kldstat | Kernel module status |
| kldunload | Unload kernel module |
| ldconfig | Configure shared libs |

### Disk & Storage

| Command | Description |
|---------|-------------|
| bectl | ZFS boot environment |
| decryptcore | Decrypt crash dump |
| fdisk | Partition editor |
| ggate | GEOM gate |
| hastd | Highly available storage |
| md5 | MD5 checksum |
| nvmecontrol | NVMe control |
| zfsbootcfg | ZFS boot config |

### System Commands

| Command | Description |
|---------|-------------|
| adjkerntz | Adjust kernel timezone |
| comcontrol | Serial control |
| conscontrol | Console control |
| ddb | DDB debugger |
| dmesg | Display messages |
| init | Init process |
| reboot | Reboot |
| shutdown | Shutdown |
| sysctl | Get/set kernel |

---

## usr.bin/ — User Commands

**Path:** `usr.bin/`
**Count:** 282 commands

### Development & Compilation

| Command | Description |
|---------|-------------|
| addr2line | Address to line |
| ar | Archive utility |
| c89 | C compiler (C89) |
| c99 | C compiler (C99) |
| cap_mkdb | Capability database |
| chpass | User database |
| compile_et | Error table compiler |
| diff | File diff |
| diff3 | 3-way diff |
| elfcopy | ELF copy |
| elfctl | ELF control |
| elfdump | ELF dumper |
| indent | Code formatter |
| lex | Lexical analyzer |
| make | Make build tool |
| mkcsmapper | Charset mapper |
| mkesdb | String table |
| mkstr | Message string |
| nm | Symbol lister |
| objcopy | Object copy |
| objdump | Object dumper |
| patch | Apply patches |
| ranlib | Archive indexer |
| rpcgen | RPC compiler |
| size | Section sizes |
| strings | String finder |
| strip | Strip symbols |
| tsort | Topological sort |
| yacc | Parser generator |

### Shells & Interpreters

| Command | Description |
|---------|-------------|
| csh | C shell |
| sh | POSIX shell |

### Editors

| Command | Description |
|---------|-------------|
| ed | Line editor |
| ex | EX editor |
| vi | Visual editor |

### Text Processing

| Command | Description |
|---------|-------------|
| awk | AWK interpreter |
| basename | Base name |
| cat | Concatenate |
| col | Column filter |
| colrm | Remove columns |
| column | Column formatter |
| comm | Common lines |
| csplit | Split by context |
| cut | Cut columns |
| dc | Desk calculator |
| dirname | Directory name |
| expand | Expand tabs |
| factor | Factor number |
| fold | Fold lines |
| grep | Pattern matching |
| head | First lines |
| hexdump | Hex dump |
| join | Join lines |
| less | Pager |
| more | Pager |
| nl | Number lines |
| od | Octal dump |
| paste | Paste lines |
| pr | Print formatter |
| printf | Format print |
| rev | Reverse lines |
| sed | Stream editor |
| sort | Sort lines |
| split | Split files |
| tail | Last lines |
| tr | Translate characters |
| uniq | Unique lines |
| wc | Word count |
| xargs | Argument list |

### File Operations

| Command | Description |
|---------|-------------|
| chown | Change owner |
| chmod | Change mode |
| cmp | Compare files |
| cp | Copy |
| file | File type |
| find | Find files |
| ln | Link |
| ls | List |
| mkdir | Make dir |
| mv | Move |
| pax | Archive |
| rm | Remove |
| rmdir | Remove dir |
| touch | Touch file |
| unlink | Unlink |

### System Status

| Command | Description |
|---------|-------------|
| du | Disk usage |
| env | Environment |
| groups | Groups |
| id | Identity |
| logname | Login name |
| nice | Nice value |
| nohup | No hangup |
| passwd | Password |
| printenv | Print env |
| quota | Quota |
| stat | File status |
| tee | T-pipe |
| tty | Terminal name |
| uname | System info |
| uptime | Uptime |
| who | Who |
| whoami | Who am I |

### Network

| Command | Description |
|---------|-------------|
| finger | User info |
| ftp | FTP client |
| nc | Netcat |
| netstat | Network stats |
| ping | Ping |
| rsh | Remote shell |
| scp | Secure copy |
| sftp | Secure FTP |
| ssh | Secure shell |
| telnet | Telnet |
| tftp | Trivial FTP |
| traceroute | Trace route |

### Archive & Compression

| Command | Description |
|---------|-------------|
| bzip2 | BZIP2 compress |
| bzip2recover | BZIP2 recover |
| compress | Compress |
| cpio | Archive |
| gzip | GZIP compress |
| tar | Tape archive |
| unzip | ZIP extract |
| xz | XZ compress |
| zstd | Zstandard |

### Miscellaneous

| Command | Description |
|---------|-------------|
| bc | Calculator |
| cal | Calendar |
| calendar | Calendar |
| crontab | Cron table |
| logger | System logger |
| mesg | Talk permission |
| talk | Talk |
| wall | Write all |
| write | Write to user |

---

## usr.sbin/ — System Administration Commands

**Path:** `usr.sbin/`
**Count:** 236 commands

### Boot & Init

| Command | Description |
|---------|-------------|
| bhyve | Hypervisor |
| bhyvectl | Bhyve control |
| bhyveload | Bhyve loader |
| boot0cfg | Boot manager |
| bootparamd | Boot params daemon |
| boottrace | Boot tracing |
| btxld | BTX loader |
| efibootmgr | EFI boot manager |
| efidp | EFI device paths |
| eftable | EFI tables |
| efivar | EFI variables |
| kldxref | KLD reference |
| vt | Virtual terminal |

### User & Group Management

| Command | Description |
|---------|-------------|
| adduser | Add user |
| chgrp | Change group |
| chown | Change owner |
| chpass | User database |
| chroot | Change root |
| etcupdate | etc update |
| groups | Groups |
| login | Login |
| logout | Logout |
| makefs | Make filesystem |
| makemap | Make map |
| pamtest | PAM test |
| passwd | Password |
| pwd_mkdb | Password database |
| pw | User database command |
| rmuser | Remove user |
| setfmac | Set MAC |
| setpmac | Set process MAC |
| sysrc | System rc |

### Process Management

| Command | Description |
|---------|-------------|
| daemon | Run daemon |
| killall | Kill all |
| proccontrol | Process control |
| procstat | Process status |
| rctl | Resource control |
| renice | Renice |
| rtprio | Real-time priority |
| traces | Trace system |

### Disk & Filesystem

| Command | Description |
|---------|-------------|
| atacontrol | ATA control |
| badsect | Bad sectors |
| caliper | Calibration |
| devctl | Device control |
| devinfo | Device info |
| diskinfo | Disk info |
| dumpcis | Dump CIS |
| fifolog | FIFO log |
| fstyp | Filesystem type |
| gpart | GEOM partition |
| mfiutil | MFI utility |
| mlx5tool | MLX5 tool |
| mptutil | MPTable utility |
| mtest | Memory test |
| nvmecontrol | NVMe control |
| pciconf | PCI config |
| sesutil | SES utility |
| spi | SPI tool |
| trcfg | Trim config |

### Network Management

| Command | Description |
|---------|-------------|
| arp | ARP table |
| atmconfig | ATM config |
| bsnmpd | SNMP daemon |
| ctrl-alt-del | Ctrl-Alt-Del |
| dhcpd | DHCP server |
| dhcpleases | DHCP leases |
| flowctl | Flow control |
| ftp-proxy | FTP proxy |
| host | DNS lookup |
| ifmcstat | Multicast stats |
| inetd | Internet daemon |
| iostat | I/O stats |
| ipfwpcap | IPFW PCAP |
| ipsec | IPsec |
| iscsid | iSCSI daemon |
| iscsictl | iSCSI control |
| jail | Jail control |
| jexec | Jail exec |
| jls | Jail list |
| ndp | IPv6 neighbor |
| netinfo | Network info |
| nfsd | NFS daemon |
| nfsdumpstate | NFS state |
| ngctl | Netgraph control |
| ntpdate | NTP date |
| ntpdc | NTP control |
| ntpd | NTP daemon |
| ntptime | NTP time |
| ntpq | NTP query |
| ntpdc | NTP dc |
| ping6 | Ping IPv6 |
| ppp | PPP daemon |
| rarpd | RARP daemon |
| rip6query | RIP6 query |
| route6d | IPv6 router |
| rpcbind | RPC binder |
| rtadvctl | Router adv |
| rtadvd | Router adv daemon |
| rtsold | Router solicitation |
| rwhod | RWHO daemon |
| slbd | SLB daemon |
| snmpctl | SNMP control |
| spamd | Spam daemon |
| sppp | PPPoE |
| sshd | SSH daemon |
| tcpdchk | TCP wrapper check |
| tcpdmatch | TCP match |
| tcpdump | Packet sniffer |
| traceroute | Trace route |
| traceroute6 | Trace route IPv6 |
| wpa | WPA supplicant |
| ypbind | NIS bind |
| ypcat | NIS cat |
| ypinit | NIS init |
| ypmatch | NIS match |
| yppasswdd | NIS passwd |
| yppush | NIS push |
| ypserv | NIS server |
| ypset | NIS set |
| ypwhich | NIS which |
| zdump | Zone dump |
| zic | Zone compiler |

### System Services

| Command | Description |
|---------|-------------|
| cron | Cron daemon |
| devd | Device daemon |
| init | Init |
| jail | Jail |
| powerd | Power daemon |
| service | Service control |
| syslogd | Syslog daemon |
| watchdogd | Watchdog daemon |

### System Monitoring

| Command | Description |
|---------|-------------|
| apm | APM control |
| apmd | APM daemon |
| camdd | CAM daemon |
| cdpd | Cisco CDP |
| devd | Device change |
| fstat | File status |
| gstat | GEOM stats |
| iostat | I/O stats |
| ipcs | IPC stats |
| kdump | Kernel dump |
| ktrace | Kernel trace |
| last | Last logins |
| lastcomm | Last commands |
| lsfs | List filesystems |
| lsvfs | List VFS |
| netstat | Network stats |
| nfsstat | NFS stats |
| pstat | Pstat |
| pwd_show | Show pwd |
| sa | System activity |
| scpbus | SCSI bus |
| sestat | SES status |
| sockstat | Socket stats |
| systat | System stats |
| top | Top processes |
| vmstat | VM stats |

### Hardware Control

| Command | Description |
|---------|-------------|
| acpi | ACPI control |
| ctlstat | CAM Target Layer |
| dbShow | Debug show |
| dbri | DBRI audio |
| devinfo | Device info |
| fbtab | Framebuffer tab |
| gpioctl | GPIO control |
| i2c | I2C tools |
| io | I/O port |
| kbdnc | Keyboard nc |
| kbdcontrol | Keyboard |
| kbdmap | Keyboard map |
| lptcontrol | Parallel port |
| moused | Mouse daemon |
| pcic | PCMCIA control |
| pcitweak | PCI tweak |
| pfctl | Packet filter |
| scsi | SCSI tools |
| smbutil | SMB utility |
| spkrtest | Speaker test |
| ugidfw | User GID fw |
| usbconfig | USB config |
| usbdump | USB dump |
| vidcontrol | Video control |
| vitfonts | Video fonts |

### Installation & Updates

| Command | Description |
|---------|-------------|
| bsdinstall | FreeBSD installer |
| bsdconfig | Configuration |
| freebsd-update | Update FreeBSD |
| pkg | Package manager |
| pkg-static | Static pkg |

### Logging & Accounting

| Command | Description |
|---------|-------------|
| audit | Audit control |
| auditd | Audit daemon |
| auditdistd | Audit dist |
| auditreduce | Audit reduce |
| praudit | Audit print |
| lastlogin | Last login |
| newsyslog | Newsyslog |
| sac | Session accounting |
| sa | System activity |

### Time & Locale

| Command | Description |
|---------|-------------|
| adjkerntz | Adjust timezone |
| ntpdate | NTP date |
| ntpq | NTP query |
| tzsetup | Timezone setup |
| zdump | Zone dump |
| zic | Zone compiler |

---

## Build System

Userland commands use BSD make:

```bash
# Build single command
cd usr.bin/foo && make

# Build all in directory
make -C bin

# Build world
make buildworld
```