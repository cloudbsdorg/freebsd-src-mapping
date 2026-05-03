# sys/nlm/ — Network Lock Manager Codebase Map

**Path:** `sys/nlm/`
**Purpose:** Network Lock Manager (NFS locking)

## Overview

NLM provides byte-range locking for NFS files. It's used by the `rpc.lockd` daemon.

## Files

| File | Purpose |
|------|---------|
| `nlm_advlock.c` | Advisory locking |
| `nlm_prot_clnt.c` | Client-side |
| `nlm_prot_impl.c` | Implementation |
| `nlm_prot_server.c` | Server-side |
| `nlm_prot_svc.c` | Service |
| `nlm_prot_xdr.c` | XDR encoding |
| `nlm_prot.h` | Protocol header |
| `nlm.h` | Main header |
| `sm_inter_xdr.c` | Statd mon encoding |
| `sm_inter.h` | Statd monitor |

## NLM Lock Message

```c
// nlm_lock
struct nlm_lock {
    char     *caller_name;         // Client name
    struct   nlm_oid fh;          // Object ID (file)
    struct   nlm_oid oh;          // Owner ID
    u_int32_t svid;               // PID equivalent
    struct   nlm_lock range;      // Byte range
};
```

## Lock Types

| Type | Description |
|------|-------------|
| NLM_READ | Shared read lock |
| NLM_WRITE | Exclusive write lock |
| NLM_CANCEL | Cancel pending lock |
| NLM_FREE | Release lock |

## Relationship to NFS

```
NFS Client                    NFS Server
    │                           │
    ├─── fcntl() ──────────────┼─── NLM
    │        │                  │        │
    │        │                  │        ▼
    │        ▼                  │   nlm_prot_server.c
    │   nlm_prot_clnt.c        │
    │        │                  │
    ▼        ▼                  ▼
    rpc.lockd (userland) ←→ rpc.lockd (userland)
    │
    ▼
    smd (statd)
```

## See Also

- `sys/rpc/` - SunRPC
- `sys/nfs/` - NFS