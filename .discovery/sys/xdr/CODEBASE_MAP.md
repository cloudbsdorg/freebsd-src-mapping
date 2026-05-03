# sys/xdr/ — XDR Codebase Map

**Path:** `sys/xdr/`
**Purpose:** External Data Representation for RPC

## Overview

XDR provides platform-independent data serialization for RPC.

## Key Files

| File | Purpose |
|------|---------|
| `xdr.c` | XDR implementation |
| `xdr.h` | Header |

## XDR Types

```c
// Basic XDR types
bool_t xdr_bool(XDR *, bool_t *);
bool_t xdr_char(XDR *, char *);
bool_t xdr_u_char(XDR *, u_char *);
bool_t xdr_int(XDR *, int *);
bool_t xdr_u_int(XDR *, u_int *);
bool_t xdr_long(XDR *, long *);
bool_t xdr_u_long(XDR *, u_long *);
bool_t xdr_short(XDR *, short *);
bool_t xdr_u_short(XDR *, u_short *);
bool_t xdr_string(XDR *, char **, u_int);
bool_t xdr_array(XDR *, caddr_t *, u_int, u_int, int, xdrproc_t);
bool_t xdr_bytes(XDR *, char **, u_int *, u_int);
bool_t xdr_opaque(XDR *, caddr_t, u_int);
```

## See Also

- `sys/rpc/` - RPC (uses XDR)
- `lib/librpc/` - Userland RPC