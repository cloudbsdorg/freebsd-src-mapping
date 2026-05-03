# sys/kgssapi/ — GSSAPI Codebase Map

**Path:** `sys/kgssapi/`
**Purpose:** Kernel GSSAPI interface

## Overview

KGSSAPI provides Generic Security Services API for kernel-level security protocols.

## Key Files

| File | Purpose |
|------|---------|
| `kgss_api.c` | GSSAPI implementation |
| `kgss_krb5.c` | Kerberos 5 GSSAPI |

## GSSAPI Functions

```c
// Context establishment
gss_ctx_id_t gss_init_sec_context(...);
OM_uint32 gss_accept_sec_context(...);

// Context management
OM_uint32 gss_delete_sec_context(...);
OM_uint32 gss_process_context_token(...);

// Message protection
OM_uint32 gss_get_mic(...);
OM_uint32 gss_verify_mic(...);
OM_uint32 gss_wrap(...);
OM_uint32 gss_unwrap(...);
```

## See Also

- `sys/kern/uipc_syscalls.c` - RPC syscalls
- `crypto/heimdal/` - Kerberos implementation