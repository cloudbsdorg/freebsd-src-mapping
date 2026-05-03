# lib/libugidfw/ — Firewall UID Control Codebase Map

**Path:** `lib/libugidfw/`
**Purpose:** User/group firewall control

## Overview

libugidfw provides functions for firewall UID/GID control.

## Key Files

| File | Purpose |
|------|---------|
| `libugidfw.h` | Header |
| `libugidfw.c` | Main |

## Key Functions

```c
int fwck_rule(const char *, struct fwd_leaf *, struct fwd_rulehead *);
int fwck_ruleset(const char *, struct fwd_rulehead *);
```

## See Also

- `sys/netpfil/ipfw/` - Kernel ipfw