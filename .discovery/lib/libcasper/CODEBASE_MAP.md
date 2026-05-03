# lib/libcasper/ — Casper Service Library Codebase Map

**Path:** `lib/libcasper/`
**Purpose:** Casper process sandboxing

## Overview

libcasper provides a library for creating and communicating with Casper services.

## Key Files

| File | Purpose |
|------|---------|
| `libcasper.c` | Main |
| `cap孩子.c` | Capability functions |
| `cap-proc.c` | Process caps |
| `cap-sysctl.c` | Sysctl caps |
| `cap-domain.c` | Domain caps |

## Key Functions

```c
// Service initialization
int cap_init(const char *);
void cap_close(int);

// Capability limits
int cap_limit(const char *, int, ...);

// Service limits
struct catalog *cap_get_catalog_limits(void);
struct proc *cap_get_proc_limits(void);
```

## Services

- `cap_proc` - Process limits
- `cap_sysctl` - Sysctl limits
- `cap_domain` - Domain limits
- `cap_named` - Named services

## See Also

- `lib/libcasper_service/` - Service helpers