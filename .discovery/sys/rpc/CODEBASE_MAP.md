# sys/rpc/ — RPC Framework Codebase Map

**Path:** `sys/rpc/`
**Files:** 21 C source files
**Purpose:** Remote Procedure Call framework (SunRPC)

## Overview

The RPC framework provides SunRPC (Open Network Computing RPC) implementation used by NFS and other network services.

## Client Side

### Client Creation

| File | Purpose |
|------|---------|
| `clnt_dg.c` | Datagram RPC (UDP) |
| `clnt_vc.c` | Virtual Circuit (TCP) |
| `clnt_rc.c` | Raw sockets |
| `clnt_nl.c` | NETLINK |
| `clnt_bck.c` | Batching |

### Client Handle

```c
// Client handle
typedef struct clnt_ops {
    enum clnt_stat (*cl_call)(CLIENT *, u_long, xdrproc_t, void *,
        xdrproc_t, void *, struct timeval);
    void (*cl_abort)(CLIENT *);
    void (*cl_geterr)(CLIENT *, struct rpc_err *);
    bool_t (*cl_freeres)(CLIENT *, xdrproc_t, void *);
    void (*cl_destroy)(CLIENT *);
} CLNT_OPS;

struct clnt {
    AUTH      *cl_auth;           // Authentication
    struct clnt_ops *cl_ops;      // Operations
    int       cl_fd;              // File descriptor
    // ... more
};
```

### Client Functions

```c
// Creation
CLIENT *clnt_ncreate(const char *, const rpcprog_t,
    const rpcvers_t, const char *);
CLIENT *clnt_ncreate_broadcast(const char *, const rpcprog_t,
    const rpcvers_t, xdrproc_t, void *, xdrproc_t, void *,
    struct netbuf *);
CLIENT *clnt_ncreate_mt(const char *, const rpcprog_t,
    const rpcvers_t, const char *);

// Simple creation
CLIENT *clnt_create(const char *host, const rpcprog_t prog,
    const rpcvers_t vers, const char *prot);

// Destroy
void clnt_destroy(CLIENT *);
```

## Server Side

### Server Dispatch

| File | Purpose |
|------|---------|
| `svc.c` | Generic server |
| `svc_dg.c` | Datagram server |
| `svc_vc.c` | Virtual Circuit server |
| `svc_generic.c` | Generic dispatcher |
| `svc_auth.c` | Authentication |
| `svc_auth_unix.c` | UNIX auth |

### Service Registration

```c
// Register program/version
bool_t svc_reg(SVCXPRT *, const rpcprog_t, const rpcvers_t,
    void (*dispatch)(svc_req *, SVCXPRT *),
    const struct netconfig *);

// Unregister
void svc_unreg(const rpcprog_t, const rpcvers_t);
```

### Server Transport

```c
// Server transport
struct svc_req {
    rpcprog_t      rq_prog;        // Program
    rpcvers_t      rq_vers;        // Version
    rpcproc_t      rq_proc;        // Procedure
    struct opaque_auth rq_cred;    // Credentials
    CLIENT         *rq_clnt;       // Client (for reply)
};

struct svcxprt {
    int             xp_fd;         // File descriptor
    const struct xp_ops *xp_ops;    // Operations
    struct netbuf   xp_ltaddr;     // Local addr
    struct netbuf   xp_rtaddr;     // Remote addr
};
```

## Authentication

| File | Purpose |
|------|---------|
| `auth_none.c` | NULL authentication |
| `auth_unix.c` | UNIX-style (AUTH_SYS) |
| `authunix_prot.c` | UNIX auth protocol |
| `svc_auth.c` | Server-side auth |
| `svc_auth_unix.c` | Server UNIX auth |

### Auth Structures

```c
// AUTH_NONE
struct auth_none {
    // No data
};

// AUTH_SYS
struct authunix_parms {
    uid_t   aup_uid;              // User ID
    gid_t   aup_gid;              // Primary GID
    int     aup_len;              // GID count
    gid_t   *aup_gids;            // Supplementary GIDs
    char    *aup_machname;        // Machine name
};
```

## XDR (External Data Representation)

XDR types are in lib/libc/xdr/. Kernel has some inline support.

```c
// Standard XDR types
bool_t xdr_int(XDR *, int *);
bool_t xdr_u_int(XDR *, u_int *);
bool_t xdr_long(XDR *, long *);
bool_t xdr_u_long(XDR *, u_long *);
bool_t xdr_string(XDR *, char **, u_int);
bool_t xdr_array(XDR *, caddr_t *, u_int, u_int, int, xdrproc_t);
bool_t xdr_struct(XDR *, caddr_t, const int [], const int []);

// Opaque
bool_t xdr_opaque(XDR *, caddr_t, u_int);
bool_t xdr_bytes(XDR *, char **, u_int *, u_int);
```

## RPCB (Portmapper)

| File | Purpose |
|------|---------|
| `rpcb_prot.c` | RPCB protocol |
| `rpcb_clnt.c` | RPCB client |

### RPCB Operations

```c
// rpcb_set - Register with portmapper
bool_t rpcb_set(const rpcprog_t, const rpcvers_t,
    const struct netconfig *, const struct netbuf *);

// rpcb_unset - Unregister
bool_t rpcb_unset(const rpcprog_t, const rpcvers_t,
    const struct netconfig *);

// rpcb_getaddr - Get address from portmapper
bool_t rpcb_getaddr(const rpcprog_t, const rpcvers_t,
    const struct netconfig *, char *, const char *);
```

## RPC Protocol

| File | Purpose |
|------|---------|
| `rpc_prot.c` | RPC protocol |
| `rpc_callmsg.c` | Call message encoding |

### Message Types

```c
// RPC call header
struct rpc_msg {
    u_int32_t rm_xid;             // Transaction ID
    enum msg_type rm_direction;    // CALL or REPLY
    union {
        struct call_body RM_cmb;
        struct reply_body RM_rmb;
    } ru;
};

// Message types
enum msg_type {
    CALL = 0,
    REPLY = 1
};

// Reply status
enum reply_stat {
    MSG_ACCEPTED = 0,
    MSG_DENIED = 1
};
```

## Replay Protection

| File | Purpose |
|------|---------|
| `replay.c` | Replay detection |

```c
struct replbody {
    // ... replay state
};

// Check for replay
bool_t repl_check(struct replbody *, struct svc_req *);

// Mark as replayed
void repl_mark(struct replbody *, struct svc_req *);
```

## Network Selection

| File | Purpose |
|------|---------|
| `getnetconfig.c` | Network configuration |

```c
struct netconfig {
    char    *nc_netid;            // Network ID (udp, tcp)
    struct netbuf nc_device;      // Device address
    unsigned int nc_flag;         // Flags
    struct ifaddrs *nc_ifaddrs;  // Interface addresses
    // ... more
};
```

## Initialization

```c
// rpc_clnt_init()
// rpc_svc_init()
```

## Key Dependencies

```c
#include <rpc/rpc.h>              // Main RPC header
#include <rpc/clnt.h>             // Client interface
#include <rpc/svc.h>              // Server interface
#include <rpc/xdr.h>              // XDR
#include <rpc/rpcb.h>             // Portmapper
```

## See Also

- `sys/rpcsvc/` - RPC services (NFS, mountd, etc.)
- `sys/nfsclient/` - NFS client (uses RPC)
- `sys/nfsserver/` - NFS server (uses RPC)
- `lib/libc/rpc/` - Userland RPC