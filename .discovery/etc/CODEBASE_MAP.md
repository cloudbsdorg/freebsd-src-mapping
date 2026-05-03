# etc/ — Configuration Templates Codebase Map

**Path:** `etc/`
**Purpose:** System configuration templates

## Overview

The etc directory contains template files for system configuration.

## Key Files

| File | Purpose |
|------|---------|
| `rc.conf` | System startup configuration |
| `sysctl.conf` | Kernel sysctl tunables |
| `login.conf` | Login class definitions |
| `device.hints` | Device hints for loader |
| `ttys` | Terminal configuration |

## rc.conf Variables

```sh
hostname="freebsd.example.com"
ifconfig_em0="DHCP"
sshd_enable="YES"
sendmail_enable="NONE"
dumpdev="AUTO"
```

## periodic/ Scripts

```
periodic/
├── daily/       # Daily maintenance
├── weekly/      # Weekly maintenance
├── monthly/    # Monthly maintenance
└── security/   # Security checks
```

## See Also

- `usr.sbin/etc/` - Configuration utilities