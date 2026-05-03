# contrib/tcp_wrappers/ — TCP Wrappers Codebase Map

**Path:** `contrib/tcp_wrappers/`
**Purpose:** TCP wrappers access control

## Overview

TCP wrappers provide host-based access control.

## Key Files

| File | Purpose |
|------|---------|
| `hosts_access.c` | Access check |
| `hosts_options.c` | Options |
| `tcpd.c` | Wrapper daemon |
| `from.c` | From checking |
| `leer.c` | Read |

## Access Control

```
/etc/hosts.allow
/etc/hosts.deny
```

## Rule Format

```
daemon : client [: option]
```

## Options

- `allow` - Allow
- `deny` - Deny
- `spawn` - Run command
- `twist` - Replace connection

## See Also

- `lib/libwrap/` - Library