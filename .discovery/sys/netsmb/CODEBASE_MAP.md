# sys/netsmb/ — SMB/CIFS Client Codebase Map

**Path:** `sys/netsmb/`
**Files:** 9 C source files
**Purpose:** SMB/CIFS network file system client

## Overview

The netsmb module provides kernel-native SMB (Server Message Block) client implementation, used for accessing Windows/Samba shares.

## Core Files

| File | Purpose |
|------|---------|
| `smb_usr.c` | User interface |
| `smb_subr.c` | Main functions |
| `smb_dev.c` | Device interface |

## Connection Management

| File | Purpose |
|------|---------|
| `smb_conn.c` | Connection state |
| `smb_trantcp.c` | TCP transport |

## SMB Protocol

| File | Purpose |
|------|---------|
| `smb_smb.c` | SMB commands |
| `smb_rq.c` | Request building |
| `smb_crypt.c` | SMB encryption |

## I/O Daemon

| File | Purpose |
|------|---------|
| `smb_iod.c` | I/O daemon |

## Key Structures

```c
// SMB connection
struct smb_conn {
    struct smb_vc        *vc;            // Vong context
    struct smb_share     *ss;            // Share
    struct socket        *so;             // TCP socket
    struct sockaddr_storage dest;         // Server address
    char                *username;
    char                *password;
    int                 slm_protocol;
    // ... more
};

// SMB vong (virtual circuit)
struct smb_vc {
    struct smb_conn      *vc_mc;          // Master connection
    int                 vc_hflags;       // Header flags
    u_short             vc_hflags2;       // Header flags 2
    u_short             vc_smbuid;        // UID
    u_int32_t           vc_session_key;
    // ... more
};

// SMB share
struct smb_share {
    struct smb_conn      *ss_vc;          // Vong
    char                *ss_name;         // Share name
    char                *ss_pass;
    int                 ss_type;          // Share type
    // ... more
};
```

## SMB Session Flow

```
1. Connect to server (TCP)
   │
   ▼
2. Negotiate protocol (SMB negprot)
   │
   ▼
3. Session setup (SMB sesssetupX)
   │
   ▼
4. Tree connect (SMB tconX)
   │
   ▼
5. SMB operations (read/write)
   │
   ▼
6. Tree disconnect
   │
   ▼
7. Logoff
```

## SMB Commands (Core)

```c
#define SMB_COM_CREATE_DIRECTORY    0x00
#define SMB_COM_DELETE_DIRECTORY    0x01
#define SMB_COM_OPEN               0x02
#define SMB_COM_CREATE             0x03
#define SMB_COM_CLOSE              0x04
#define SMB_COM_FLUSH              0x05
#define SMB_COM_DELETE             0x06
#define SMB_COM_RENAME             0x07
#define SMB_COM_QUERY_INFORMATION  0x08
#define SMB_COM_SET_INFORMATION    0x09
#define SMB_COM_READ               0x0A
#define SMB_COM_WRITE              0x0B
#define SMB_COM_LOCK_BYTE_RANGE    0x0C
#define SMB_COM_UNLOCK_BYTE_RANGE  0x0D
#define SMB_COM_CREATE_TEMPORARY   0x0E
#define SMB_COM_CREATE             0x0F
#define SMB_COM_CHECK_DIRECTORY     0x10
#define SMB_COM_PROCESSING         0x1E
#define SMB_COM_QUERY_SERVER       0x1F
// ... many more
```

## SMB2 Commands

```c
#define SMB2_OP_SESSION_SETUP      0x01
#define SMB2_OP_TREE_CONNECT       0x03
#define SMB2_OP_CREATE              0x05
#define SMB2_OP_CLOSE               0x06
#define SMB2_OP_READ                0x08
#define SMB2_OP_WRITE               0x09
#define SMB2_OP_QUERY_DIRECTORY     0x0E
```

## Encryption

```c
// smb_crypt.c
int smb_encrypt(const char *pass, const u_int8_t *challenge,
    u_int8_t *response);
int smb_ntlmv2_hash(const char *pass, const char *user,
    const char *domain, u_int8_t *hash);
```

## Device Interface

```c
// smb_dev.c - /dev/smbus* devices
int smb_dev_open(struct cdev *dev, int mode, int type,
    struct thread *td);
int smb_dev_close(struct cdev *dev, int mode, int type,
    struct thread *td);
```

## sysctl Variables

```
netsmb.netbios_enabled
netsmb.enable_netbios
```

## Key Dependencies

```c
#include <netsmb/smb.h>             // Main header
#include <netsmb/smb_conn.h>         // Connection
#include <netsmb/smb_rq.h>           // Request
#include <netsmb/smb_smb.h>          // SMB commands
```

## See Also

- `sys/fs/smbfs/` - SMBFS filesystem
- `sys/netsmb/smbfs/` - SMBFS module
- `lib/libsmb/` - Userland SMB library