# share/ — Shared Resources Codebase Map

**Path:** `share/`
**Purpose:** Architecture-independent resources

## Overview

The share directory contains architecture-independent resources.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `mk/` | Build makefiles |
| `skel/` | Skeleton files |
| `telnetd/` | Telnetd files |
| `zoneinfo/` | Timezone data |
| `man/` | Manual pages |
| `dict/` | Word lists |
| `misc/` | Misc data |
| `secure/` | TLS certs |

## timezone Data

```
share/zoneinfo/
├── America/
│   ├── New_York
│   ├── Los_Angeles
│   └── Chicago
├── Europe/
│   ├── London
│   ├── Paris
│   └── Berlin
├── Asia/
│   ├── Tokyo
│   └── Shanghai
└── UTC
```

## Skeleton Files

```
share/skel/
├── .cshrc
├── .profile
├── .shrc
└── dot.cshrc
```

## Build Makefiles

```
share/mk/
├── bsd.prog.mk
├── bsd.lib.mk
├── bsd.files.mk
└── bsd.sys.mk
```

## See Also

- `etc/` - System configuration