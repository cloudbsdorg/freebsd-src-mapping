# contrib/openpam/ — OpenPAM Source Codebase Map

**Path:** `contrib/openpam/`
**Purpose:** Pluggable Authentication Modules

## Overview

OpenPAM provides PAM (Pluggable Authentication Modules) support.

## Key Files

| File | Purpose |
|------|---------|
| `lib/libpam/` | Main PAM library |
| `lib/pam_conv.c` | Conversation |
| `lib/pam_item.c` | Items |
| `lib/pam_misc.c` | Misc |
| `modules/` | PAM modules |
| `modules/pam_unix/` | Unix auth |
| `modules/pam_permit/` | Permit |
| `modules/pam_deny/` | Deny |
| `modules/pam_env/` | Environment |

## Key Structures

```c
struct pam_handle {
    char *service;
    struct pam_conv *pamConversation;
    char *user;
    char *rhost;
    char *ruser;
    // ... more
};
```

## Modules

| Module | Purpose |
|--------|---------|
| `pam_unix/` | /etc/passwd auth |
| `pam_permit/` | Always permit |
| `pam_deny/` | Always deny |
| `pam_env/` | Set environment |
| `pam_nologin/` | Check nologin |
| `pam_shells/` | Check valid shell |

## See Also

- `sys/security/` - Kernel security