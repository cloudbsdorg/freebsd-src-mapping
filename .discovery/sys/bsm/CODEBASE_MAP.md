# sys/bsm/ — BSM Audit Codebase Map

**Path:** `sys/bsm/`
**Purpose:** Basic Security Module (BSM) audit record format

## Overview

The bsm directory contains BSM (Basic Security Module) audit record definitions used by the audit subsystem.

## Key Files

| File | Purpose |
|------|---------|
| `bsm_lib.h` | BSM library interface |
| `bsm_record.h` | Audit record types |
| `bsm_socket.h` | Socket audit |

## Audit Record Types

```c
// BSM token types
AUT_INVALID
AUT_OHEADER
AUT_AHEADER
AUT_TRAILER
AUT_SUBJECT
AUT_PROCESS
AUT_RETURN
AUT_ARG
AUT_DATA
AUT_OPAQUE
AUT_NEWGROUP
```

## See Also

- `sys/security/audit/` - Audit subsystem
- `lib/libbsm/` - BSM library