# libexec/ — System Library Executables Codebase Map

**Path:** `libexec/`
**Purpose:** System library executables and helpers

## Overview

The libexec directory contains programs that are typically invoked by other programs, not directly by users.

## Key Programs

| Program | Purpose |
|---------|---------|
| `ftpd/` | FTP daemon |
| `getty` | Get terminal |
| `init.d/` | Service scripts |
| `login/` | Login program |
| `rshd/` | Remote shell daemon |
| `sshd/` | SSH daemon |
| `syslogd/` | System log daemon |
| `telnetd/` | Telnet daemon |

## ftpd/ - FTP Server

| File | Purpose |
|------|---------|
| `ftpd.c` | FTP daemon main |
| `ftpcount.c` | Count FTP users |
| `ftpdctl.c` | FTP daemon control |
| `ftpwho.c` | FTP status |

## login/ - Login Program

| File | Purpose |
|------|---------|
| `login.c` | Login main |
| `login_class.c` | Login class |
| `login_cap.c` | Login capabilities |
| ` login_hints.c` | Login hints |
| ` login_perm.c` | Login permissions |

## getty/ - Terminal Getty

| File | Purpose |
|------|---------|
| `getty.c` | Getty main |
| `pathnames.h` | Paths |

## See Also

- `usr.sbin/` - System daemons
- `bin/` - User commands