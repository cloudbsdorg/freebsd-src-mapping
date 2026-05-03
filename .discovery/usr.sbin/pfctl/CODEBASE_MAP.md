# usr.sbin/pfctl/ — Packet Filter Control Codebase Map

**Path:** `usr.sbin/pfctl/`
**Purpose:** Packet filter control utility

## Overview

pfctl controls the packet filter.

## Key Files

| File | Purpose |
|------|---------|
| `pfctl.c` | Main |
| `pfctl_parser.c` | Parser |
| `pfctl_optimize.c` | Optimize |
| `pfctl_tables.c` | Tables |
| `pfctl_osfp.c` | OS fingerprint |

## Key Functions

```c
int pfctl(int, char *[]);
int pfctl_rules(int, char *[]);
int pfctl_table(int, char *[]);
```

## See Also

- `sys/netpfil/pf/` - Kernel PF