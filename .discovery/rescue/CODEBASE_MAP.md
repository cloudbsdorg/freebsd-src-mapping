# rescue/ — Rescue Utilities Codebase Map

**Path:** `rescue/`
**Purpose:** Standalone rescue utilities statically linked

## Overview

The rescue directory contains a set of critical utilities that are statically linked and can be used for system recovery when the normal system libraries are unavailable.

## Purpose

These utilities are compiled into a single `/rescue` directory with statically-linked binaries that can boot from:
- Single-user mode
- Recovery media
- Emergency boot

## Key Utilities

| Utility | Purpose |
|---------|---------|
| `cat` | File display |
| `chmod` | Change permissions |
| `chroot` | Change root |
| `cp` | Copy files |
| `date` | Show date |
| `dd` | Data copy |
| `df` | Disk usage |
| `dhclient` | DHCP client |
| `dump` | Filesystem dump |
| `dumpfs` | Dump filesystem |
| `restore` | Restore dump |
| `fsck` | Filesystem check |
| `getty` | Getty |
| `halt` | Halt system |
| `ifconfig` | Configure interface |
| `init` | Init process |
| `ls` | List files |
| `mkdir` | Make directory |
| `mount` | Mount filesystem |
| `mv` | Move files |
| `ps` | Process status |
| `rc` | RC scripts |
| `reboot` | Reboot |
| `rm` | Remove files |
| `route` | Routing |
| `setfacl` | ACL |
| `sh` | Shell |
| `swapon` | Enable swap |
| `umount` | Unmount |
| `getfacl` | Get ACL |

## Build

Built statically with:
```make
make -C rescue RESCUE=YES
```

## See Also

- `sbin/` - System administration
- `bin/` - Essential binaries