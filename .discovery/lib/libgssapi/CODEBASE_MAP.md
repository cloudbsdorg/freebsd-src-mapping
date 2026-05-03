# lib/libgssapi/ — GSSAPI Library Codebase Map

**Path:** `lib/libgssapi/`
**Purpose:** Generic Security Services API

## Overview

libgssapi provides the GSSAPI interface for Kerberos and other security mechanisms.

## Key Files

| File | Purpose |
|------|---------|
| `gssapi.c` | Main |
| `gssapi.h` | Header |
| `gssapi_krb5.c` | Kerberos |
| `gssapi_spnego.c` | SPNEGO |

## Key Functions

```c
// Context establishment
OM_uint32 gss_init_sec_context(OM_uint32 *, gss_name_t, gss_ctx_id_t *,
    gss_OID, gss_OID_set, OM_uint32, gss_channel_bindings_t,
    gss_buffer_t, gss_name_t *, gss_OID, gss_buffer_t, OM_uint32 *, int *, gss_buffer_t);

OM_uint32 gss_accept_sec_context(OM_uint32 *, gss_ctx_id_t *, gss_cred_id_t,
    gss_buffer_t, gss_channel_bindings_t, gss_name_t *, gss_OID *,
    gss_buffer_t, OM_uint32 *, int *, gss_cred_id_t *);

// Context deletion
OM_uint32 gss_delete_sec_context(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t);

// Message integrity
OM_uint32 gss_get_mic(OM_uint32 *, gss_ctx_id_t, gss_qop_t,
    gss_buffer_t, gss_buffer_t);
OM_uint32 gss_verify_mic(OM_uint32 *, gss_ctx_id_t, gss_buffer_t,
    gss_buffer_t, gss_qop_t *);

// Message privacy
OM_uint32 gss_wrap(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t,
    gss_buffer_t, int *, gss_buffer_t);
OM_uint32 gss_unwrap(OM_uint32 *, gss_ctx_id_t, gss_buffer_t,
    gss_buffer_t, int *, gss_qop_t *);
```

## OIDs

```c
GSS_C_NT_USER_NAME
GSS_C_NT_MACHINE_UID_NAME
GSS_C_NT_STRING_UID_NAME
GSS_C_NT_HOSTBASED_SERVICE_NAME
GSS_KRB5_NT_PRINCIPAL_NAME
```

## See Also

- `sys/kern/uipc_syscalls.c` - RPC
- `crypto/heimdal/` - Kerberos