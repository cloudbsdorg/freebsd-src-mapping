# sys/security/ — Security Framework Codebase Map

**Path:** `sys/security/`
**Files:** 80 files across subdirectories
**Purpose:** MAC framework, audit subsystem, security modules

## Overview

The security directory contains Mandatory Access Control (MAC) framework and various security modules, plus the BSM audit subsystem.

## MAC Framework (mac/)

The MAC framework provides pluggable security policies that can be stacked.

### Core Framework

| File | Purpose |
|------|---------|
| `mac_framework.c` | MAC framework entry points |
| `mac_policy.h` | Policy interface definition |
| `mac_framework.h` | Framework header |
| `mac_internal.h` | Internal definitions |
| `mac_label.c` | Label operations |

### VFS Integration

| File | Purpose |
|------|---------|
| `mac_vfs.c` | VFS MAC checks |
| `mac_system.c` | System operations |
| `mac_cred.c` | Credential checks |
| `mac_priv.c` | Privilege checks |

### Process & IPC

| File | Purpose |
|------|---------|
| `mac_process.c` | Process MAC labels |
| `mac_sysv_shm.c` | SysV shared memory |
| `mac_sysv_msg.c` | SysV message queues |
| `mac_sysv_sem.c` | SysV semaphores |
| `mac_posix_shm.c` | POSIX shared memory |
| `mac_posix_sem.c` | POSIX semaphores |

### Network

| File | Purpose |
|------|---------|
| `mac_net.c` | Network MAC |
| `mac_inet.c` | IPv4 MAC |
| `mac_inet6.c` | IPv6 MAC |
| `mac_socket.c` | Socket MAC |
| `mac_ipacl.c` | IP ACL |
| `mac_ifoff.c` | Interface enable/disable |

### Other Objects

| File | Purpose |
|------|---------|
| `mac_pipe.c` | Pipe MAC |
| `mac_kdb.c` | KDB MAC |
| `mac_ddb.c` | DDB MAC |
| `mac_audit.c` | Audit MAC |
| `mac_prison.c` | Prison (jail) MAC |
| `mac_syscalls.c` | Syscall MAC |

## MAC Policy Modules

### Biba (mac_biba/)

| File | Purpose |
|------|---------|
| `mac_biba.c` | Biba integrity model |
| `mac_biba.h` | Biba header |

**Biba Model:** Strict integrity - no write up, no read down.

### MLS (mac_mls/)

| File | Purpose |
|------|---------|
| `mac_mls.c` | MLS policy |
| `mac_mls.h` | MLS header |

**MLS Model:** Multi-level security - Bell-LaPadula.

### LOMAC (mac_lomac/)

| File | Purpose |
|------|---------|
| `mac_lomac.c` | LOMAC policy |
| `mac_lomac.h` | LOMAC header |

**LOMAC:** Low-watermark integrity.

### Partition (mac_partition/)

| File | Purpose |
|------|---------|
| `mac_partition.c` | Process partition policy |
| `mac_partition.h` | Partition header |

### SeeOtherUIDs (mac_seeotheruids/)

| File | Purpose |
|------|---------|
| `mac_seeotheruids.c` | Hide other users' processes |

### BSD Extended (mac_bsdextended/)

| File | Purpose |
|------|---------|
| `mac_bsdextended.c` | Extended MAC |
| `mac_bsdextended.h` | Header |
| `ugidfw_*.c` | User/group firewall |

### Other Modules

| Module | File | Purpose |
|--------|------|---------|
| `mac_none` | `mac_none.c` | No-op policy |
| `mac_stub` | `mac_stub.c` | Stub for testing |
| `mac_test` | `mac_test.c` | Test policy |
| `mac_portacl` | `mac_portacl.c` | Port-based ACL |
| `mac_priority` | `mac_priority.c` | Process priority MAC |
| `mac_ntpd` | `mac_ntpd.c` | NTPD MAC |
| `mac_grantbylabel` | `mac_grantbylabel.c` | Grant by label |
| `mac_pimd` | `mac_pimd.c` | PIM MAC |

## MAC Label Structure

```c
struct mac_label {
    struct bpf_labels *l_labels;
    int l_count;
    struct mac_extent {
        char    *me_name;
        char    *me_data;
    } l_entries[0];
};
```

## MAC Policy Registration

```c
struct mac_policy_ops {
    // VFS
    int (*mpo_check_vnode_access)(struct thread *, struct vnode *, accmode_t);
    int (*mpo_check_vnode_open)(struct thread *, struct vnode *, accmode_t);
    int (*mpo_check_vnode_read)(...);
    int (*mpo_check_vnode_write)(...);
    int (*mpo_check_vnode_create)(...);
    int (*mpo_check_vnode_delete)(...);

    // Process
    int (*mpo_check_proc_debug)(struct thread *, struct proc *);
    int (*mpo_check_proc_sched)(struct thread *, struct proc *);

    // Network
    int (*mpo_check_inet_connect)(...);
    int (*mpo_check_inet6_connect)(...);
    int (*mpo_check_socket_bind)(...);
    int (*mpo_check_socket_listen)(...);
    // ... many more
};

struct mac_policy {
    const char *mpx_name;
    struct mac_policy_ops *mpx_ops;
    TAILQ_ENTRY(mac_policy) mpx_list;
};
```

## Veriexec (mac_veriexec/)

File integrity monitoring using cryptographic hashes.

| File | Purpose |
|------|---------|
| `mac_veriexec.c` | Main implementation |
| `mac_veriexec.h` | Header |
| `veriexec_fingerprint.c` | Fingerprint support |
| `veriexec_metadata.c` | Metadata parsing |
| `mac_veriexec_sha*.c` | SHA family (1, 256, 384, 512) |

**Supported Hashes:**
- SHA1
- SHA256
- SHA384
- SHA512

## Audit (audit/)

BSM (Basic Security Module) audit trail.

| File | Purpose |
|------|---------|
| `audit.c` | Main audit system |
| `audit.h` | Audit header |
| `audit_arg.c` | Audit argument handling |
| `audit_bsm.c` | BSM format |
| `audit_bsm_db.c` | BSM database |
| `audit_bsm_klib.c` | BSM kernel lib |
| `audit_ioctl.h` | IOCTL definitions |
| `audit_pipe.c` | Audit pipe |
| `audit_private.h` | Private definitions |
| `audit_syscalls.c` | Audit syscalls |
| `audit_trigger.c` | Audit trigger |
| `audit_worker.c` | Audit worker thread |
| `audit_dtrace.c` | DTrace integration |
| `bsm_*.c` | BSM token conversion |

### Audit Events

```c
// AUE_*: Audit event codes
AUE_OPEN
AUE_CLOSE
AUE_READ
AUE_WRITE
AUE_EXEC
AUE_EXIT
// ... hundreds more
```

### BSM Token Types

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
// ... many more
```

## Initialization

```c
// mac_framework.c
static int
mac_init(void)
{
    mac_policy_init();
    mac_label_init();
    mac_audit_init();
    mac_veriexec_init();
}

// Register all built-in policies
mac_policy_register(&mac_biba_ops);
mac_policy_register(&mac_mls_ops);
mac_policy_register(&mac_lomac_ops);
// etc.
```

## MAC Syscalls

```c
// mac_syscalls.c
mac_get_proc(mac)
mac_set_proc(mac)
mac_get_fd(fd, mac)
mac_set_fd(fd, mac)
mac_get_link(ifname, mac)
mac_set_link(ifname, mac)
mac_get_cred(ruid, euid, mac)
mac_set_cred(ruid, euid, mac)
mac_syscall(name, syscall_number)
```

## Key Dependencies

```c
#include <security/mac.h>           // MAC framework
#include <security/mac_policy.h>   // Policy ops
#include <security/mac_framework.h> // Framework header
#include <sys/audit.h>             // Audit
#include <bsm/audit_klib.h>        // BSM kernel lib
```

## sysctl Variables

```
security.mac.enabled
security.mac.biba.enabled
security.mac.mls.enabled
security.mac.lomac.enabled
security.audit.enabled
security.audit.rotate
security.jail.set_hostname_allowed
```

## See Also

- `sys/kern/kern_mac.c` - MAC syscalls
- `sys/kern/kern_audit.c` - Audit syscalls
- `sys/kern/vfs_subr.c` - VFS (MAC hooks)