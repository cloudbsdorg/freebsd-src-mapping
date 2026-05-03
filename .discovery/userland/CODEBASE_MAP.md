# userland/ — Userland Commands Codebase Map

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
| chmod | Change file modes |
| cp | Copy files |
| cpuset | Manage CPU sets |
| csh | C shell |
| date | Display date/time |
| dd | Data converter |
| df | Display filesystem usage |
| echo | Display text |
| ed | Line editor |
| kill | Send signal |
| ln | Make links |
| ls | List directory |
| mkdir | Make directories |
| mv | Move files |
| pax | Archive utility |
| ps | Process status |
| pwd | Print working directory |
| rm | Remove files |
| sh | POSIX shell |
| sync | Sync filesystems |
| test | Test condition |

---

## sbin/ — System Administration Commands

**Path:** `sbin/`
**Purpose:** Critical system administration commands

### Filesystem Commands

| Command | Description |
|---------|-------------|
| bsdlabel | Read/write disk label |
| camcontrol | CAM device control |
| dump | Dump filesystem |
| fsck_ffs | FFS filesystem check |
| growfs | Grow filesystem |
| mount | Mount filesystem |
| newfs | New filesystem |
| tunefs | Tune filesystem |
| umount | Unmount |

### Network Commands

| Command | Description |
|---------|-------------|
| dhclient | DHCP client |
| ifconfig | Interface config |
| ipfw | IP firewall |
| pfctl | Packet filter control |
| ping | Ping utility |
| route | Routing table |
| setkey | IPsec key control |

### Kernel Commands

| Command | Description |
|---------|-------------|
| kldload | Load kernel module |
| kldstat | Kernel module status |
| kldunload | Unload kernel module |
| ldconfig | Configure shared libs |

---

## usr.bin/ — User Commands

**Path:** `usr.bin/`
**Count:** 282 commands

### Development & Compilation

| Command | Description |
|---------|-------------|
| c89 | C compiler (C89) |
| c99 | C compiler (C99) |
| compile_et | Error table compiler |
| lex | Lexical analyzer |
| make | Make build tool |
| nm | Symbol lister |
| rpcgen | RPC compiler |
| yacc | Parser generator |

### Shells & Editors

| Command | Description |
|---------|-------------|
| csh | C shell |
| sh | POSIX shell |
| vi | Visual editor |

### Text Processing

| Command | Description |
|---------|-------------|
| awk | AWK interpreter |
| cat | Concatenate |
| col | Column filter |
| cut | Cut columns |
| diff | File diff |
| grep | Pattern matching |
| head | First lines |
| less | Pager |
| sed | Stream editor |
| sort | Sort lines |
| tail | Last lines |
| tr | Translate characters |
| wc | Word count |

### Network

| Command | Description |
|---------|-------------|
| ftp | FTP client |
| nc | Netcat |
| netstat | Network stats |
| ping | Ping |
| scp | Secure copy |
| sftp | Secure FTP |
| ssh | Secure shell |
| telnet | Telnet |

### Archive & Compression

| Command | Description |
|---------|-------------|
| bzip2 | BZIP2 compress |
| gzip | GZIP compress |
| tar | Tape archive |
| xz | XZ compress |

---

## usr.sbin/ — System Administration Commands

**Path:** `usr.sbin/`
**Count:** 236 commands

### Boot & Init

| Command | Description |
|---------|-------------|
| bhyve | Hypervisor |
| bhyvectl | Bhyve control |
| efibootmgr | EFI boot manager |
| boot0cfg | Boot manager |

### User & Group Management

| Command | Description |
|---------|-------------|
| adduser | Add user |
| chpass | User database |
| pw | User database command |
| rmuser | Remove user |

### Network Management

| Command | Description |
|---------|-------------|
| arp | ARP table |
| dhcpd | DHCP server |
| inetd | Internet daemon |
| jail | Jail control |
| nfsd | NFS daemon |
| pfctl | Packet filter |
| sshd | SSH daemon |
| wpa | WPA supplicant |

### System Services

| Command | Description |
|---------|-------------|
| cron | Cron daemon |
| devd | Device daemon |
| powerd | Power daemon |
| syslogd | Syslog daemon |
| watchdogd | Watchdog daemon |

### Installation & Updates

| Command | Description |
|---------|-------------|
| bsdinstall | FreeBSD installer |
| freebsd-update | Update FreeBSD |
| pkg | Package manager |

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