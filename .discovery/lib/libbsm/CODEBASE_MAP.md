# lib/libbsm/ — Basic Security Module Library Codebase Map

**Path:** `lib/libbsm/`
**Purpose:** BSM audit library

## Overview

libbsm provides the Basic Security Module (BSM) audit library for audit record generation and processing.

## Key Files

| File | Purpose |
|------|---------|
| `libbsm.h` | Header |
| `audit.bsm` | BSM functions |
| `audit_record.c` | Record management |

## Relationships

```mermaid
flowchart LR
    libbsm["libbsm"] --> libc["libc"]
```

## See Also

- `sys/bsm/` - BSM kernel