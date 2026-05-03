# lib/libpam/ — PAM Library Codebase Map

**Path:** `lib/libpam/`
**Purpose:** Pluggable Authentication Modules

## Overview

libpam provides the PAM (Pluggable Authentication Modules) library.

## Key Files

| File | Purpose |
|------|---------|
| `pam_start.c` | PAM start |
| `pam_end.c` | PAM end |
| `pam_authenticate.c` | Authentication |
| `pam_acct_mgmt.c` | Account |
| `pam_setcred.c` | Credentials |
| `pam_open_session.c` | Session open |
| `pam_close_session.c` | Session close |
| `pam_chauthtok.c` | Change token |
| `pam_get_item.c` | Get items |
| `pam_set_item.c` | Set items |
| `pam_get_data.c` | Get data |
| `pam_set_data.c` | Set data |
| `pam_strerror.c` | Error strings |

## Key Functions

```c
int pam_start(const char *service, const char *user,
    const struct pam_conv *conv, pam_handle_t **pamh);
int pam_end(pam_handle_t *pamh, int status);
int pam_authenticate(pam_handle_t *pamh, int flags);
int pam_acct_mgmt(pam_handle_t *pamh, int flags);
int pam_setcred(pam_handle_t *pamh, int flags);
int pam_open_session(pam_handle_t *pamh, int flags);
int pam_close_session(pam_handle_t *pamh, int flags);
int pam_chauthtok(pam_handle_t *pamh, int flags);
```

## Conversation

```c
struct pam_conv {
    int (*conv)(int, const struct pam_message **,
        struct pam_response **, void *);
    void *appdata_ptr;
};
```

## See Also

- `contrib/openpam/` - OpenPAM