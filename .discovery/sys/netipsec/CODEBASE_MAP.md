# sys/netipsec/ — IPsec Codebase Map

**Path:** `sys/netipsec/`
**Files:** 16 C source files
**Purpose:** IP security (authentication, encryption for IPv4/IPv6)

## Overview

IPsec provides authentication and encryption for IP packets. It includes AH (Authentication Header), ESP (Encapsulating Security Payload), and key management via IKE.

## Core Files

| File | Purpose |
|------|---------|
| `ipsec.c` | IPsec main |
| `subr_ipsec.c` | IPsec utilities |
| `ipsec_input.c` | Input processing |
| `ipsec_output.c` | Output processing |
| `ipsec_pcb.c` | IPsec PCB (protocol control block) |
| `ipsec_mbuf.c` | Mbuf manipulation |
| `ipsec_offload.c` | IPsec offload |
| `ipsec_mod.c` | Module interface |

## Key Management

| File | Purpose |
|------|---------|
| `key.c` | PF_KEYv2 key management |
| `keysock.c` | PF_KEY socket interface |
| `key_debug.c` | Key debugging |

## Security Transforms

| File | Protocol | Purpose |
|------|----------|---------|
| `xform_ah.c` | AH | Authentication Header |
| `xform_esp.c` | ESP | Encapsulating Security Payload |
| `xform_ipcomp.c` | IPComp | IP Compression |
| `xform_tcp.c` | TCP | TCP encapsulation (for NAT-T) |

## UDP Encapsulation

| File | Purpose |
|------|---------|
| `udpencap.c` | UDP encapsulation (NAT-T) |

## IPsec Flow

### Output (Encrypt/Authenticate)

```
Application
    │
    ▼
TCP/UDP (socket)
    │
    ▼
ipsec_output()
    │
    ├── Lookup SA (Security Association)
    │
    ├── xform_ah() or xform_esp()
    │       │
    │       └── crypto encrypt/authenticate
    │
    ▼
IP output (ip_output.c)
    │
    ▼
Network
```

### Input (Decrypt/Verify)

```
Network
    │
    ▼
IP input (ip_input.c)
    │
    ▼
ipsec_input()
    │
    ├── Verify AH/ESP header
    │
    ├── xform_ah() or xform_esp()
    │       │
    │       └── crypto decrypt/verify
    │
    ▼
TCP/UDP (socket)
    │
    ▼
Application
```

## Security Associations

```c
struct secpolicy {
    int             sp_idx;              // Hash index
    u_int           sp_dir;              // DIR_INBOUND/DIR_OUTBOUND
    enum security_type sp_type;         // IPSEC_TYPE_*
    struct sa_head  *sp_sah;             // SA head
    struct ipsecrequest *sp_request;    // Request chain
    int             sp_refs;             // Reference count
    struct rmlock   sp_lock;
};

struct sa_head {
    struct secpolicy *sh_sa;             // Current SA
    struct secpolicy *sh_alive_sa;       // Any valid SA
    struct sadb_x_sa *sh_tod;
    TAILQ_HEAD(, secasvar) sh_salist;   // All SAs
};

struct secasvar {
    struct sa_head  *sav_sah;            // Parent
    u_int           sav_alg_enc;         // Encryption alg
    u_int           sav_alg_auth;        // Auth alg
    u_int           sav_mode;            // Mode: transport/tunnel
    u_int           sav_soft_state;       // Lifetime state
    struct keysad   *sav_keys;           // Key material
    struct sadb_lifetime *sav_lft_c;     // Current lifetime
    struct sadb_lifetime *sav_lft_h;    // Hard lifetime
};
```

## PF_KEYv2 Interface

```c
// key.c - PF_KEY socket
struct sadb_msg {
    u_int16_t sadb_msg_version;   // Protocol version
    u_int8_t  sadb_msg_type;      // SADB_ADD, SADB_DELETE, etc.
    u_int8_t  sadb_msg_errno;     // Error
    u_int16_t sadb_msg_len;       // Message length
    u_int16_t sadb_msg_reserved;  // Reserved
    u_int32_t sadb_msg_satype;    // SA type
    u_int64_t sadb_msg_pid;       // PID
};

// Message types
#define SADB_ADD           1
#define SADB_DELETE        2
#define SADB_GET           3
#define SADB_ACQUIRE       4
#define SADB_EXPIRE        5
#define SADB_FLUSH         6
#define SADB_DUMP          7
#define SADB_X_PROMISC     8
#define SADB_X_PCHANGE     9
#define SADB_X_SPDUPDATE  10
#define SADB_X_SPDADD      11
#define SADB_X_SPDDELETE   12
#define SADB_X_SPDGET      13
#define SADB_X_SPDDUMP     14
#define SADB_X_SPDFLUSH    15
```

## Algorithm IDs

```c
// Authentication algorithms
#define SADB_AALG_NONE           0
#define SADB_AALG_MD5HMAC        1
#define SADB_AALG_SHA1HMAC       2
#define SADB_AALG_SHA2_256HMAC   3
#define SADB_AALG_SHA2_384HMAC   4
#define SADB_AALG_SHA2_512HMAC   5

// Encryption algorithms
#define SADB_EALG_NONE           0
#define SADB_EALG_DESCBC         1
#define SADB_EALG_3DESCBC        2
#define SADB_EALG_CASTCBC        3
#define SADB_EALG_BLOWFISHCBC    4
#define SADB_EALG_AES             5
#define SADB_EALG_AESCTR          6
#define SADB_EALG_AES_ICM        7
```

## NAT Traversal (NAT-T)

```c
// udpencap.c
struct udpencap {
    struct sockaddr_storage src;   // Source (NAT box)
    struct sockaddr_storage dst;   // Destination (peer)
    u_int16_t       port;           // UDP port (4500)
    int             mode;           // Encapsulation mode
};
```

## IPsec Policies

```c
// SPD (Security Policy Database)
struct ipsecrequest {
    struct ipsecrequest *p_next;    // Next request
    struct secasvar *p_sav;         // SA to use
    u_int           p_preference;   // Preference
    struct sockaddr *p_src;         // Source address
    struct sockaddr *p_dst;         // Dest address
    u_int16_t       p_proto;         // Protocol (AH/ESP/BOTH)
    u_int           p_mode;         // Mode (transport/tunnel)
};

// SPD entry
struct spd {
    struct srd {                    // SPD request data
        u_int32_t      srd_index;
        u_int           srd_prio;    // Priority
        u_int8_t       srd_proto;    // Protocol
        struct sockaddr *srd_src;   // Source range
        struct sockaddr *srd_dst;   // Dest range
        struct sockaddr *srd_mask;  // Netmask
        u_int16_t       srd_ports;   // Port range
    } spd_requests[0];
};
```

## Socket Options

```c
// IPsec per-socket options
IP_IPSEC_POLICY   // Set policy on socket
IP_IPSEC_INBOUND  // Get inbound policy
IP_IPSEC_OUTBOUND // Get outbound policy

// struct ipsec_policy
struct ipsec_policy {
    int             pol_spidx;      // SPD index
    struct sockaddr *pol_src;       // Source
    struct sockaddr *pol_dst;       // Dest
    int             pol_proto;      // Protocol
    int             pol_mode;       // Mode
};
```

## Initialization

```c
// ipsec_mod.c
static int ipsec_modevent(module_t mod, int type, void *data)
{
    switch (type) {
    case MOD_LOAD:
        ipsec_init();               // Register, attach to IP
        key_init();                 // PF_KEY
        break;
    case MOD_UNLOAD:
        ipsec_destroy();
        key_destroy();
        break;
    }
}
```

## Key Dependencies

```c
#include <netipsec/ipsec.h>        // IPsec header
#include <netipsec/xform.h>        // Transform interface
#include <netipsec/key.h>          // PF_KEY
#include <netipsec/ah.h>           // AH header
#include <netipsec/esp.h>          // ESP header
#include <netinet/ip.h>            // IPv4
#include <netinet6/ipsec.h>        // IPv6
```

## sysctl Variables

```
net.ipsec.ipv4_esp_trans_defines
net.ipsec.ipv4_esp_netdef_defines
net.ipsec.ipv4_esp_ignore_when_not_loaded
net.key.enable
net.key.allow_different_idtype
net.key.debug
```

## See Also

- `sys/netinet/ip_output.c` - IP output (IPsec hooks)
- `sys/netinet6/ipsec6.c` - IPv6 IPsec
- `sys/opencrypto/` - OpenCrypto framework
- `sys/crypto/` - Cryptographic primitives