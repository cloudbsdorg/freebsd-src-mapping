# contrib/pf/ — Packet Filter Codebase Map

**Path:** `contrib/pf/`
**Purpose:** Packet filter userland tools

## Overview

pf is the OpenBSD packet filter userland tools.

## Key Files

| File | Purpose |
|------|---------|
| `pfctl/` | Control utility |
| `pf/` | Main library |

## pfctl Commands

```bash
pfctl -e           # Enable
pfctl -d           # Disable
pfctl -F all       # Flush all
pfctl -f file      # Load rules
pfctl -sr          # Show rules
pfctl -ss          # Show state
pfctl -sa          # Show all
```

## See Also

- `sys/netpfil/pf/` - Kernel PF