# lib/libipsec/ — IPsec Library Codebase Map

**Path:** `lib/libipsec/`
**Purpose:** IPsec key management

## Overview

libipsec provides IPsec key management functionality.

## Key Files

| File | Purpose |
|------|---------|
| `libipsec.c` | Main |
| `ipsec_dump.c` | Dump |
| `ipsec_get.c` | Get |
| `ipsec_strerror.c` | Errors |

## Key Functions

```c
int ipsec_set_policy(char *, int, char **);
int ipsec_flush_policies(void);
int ipsec_get_policy(struct sadb_msg *, char **);

int sadb_getspi(struct sadb_ext **exts, struct sadb_msg **new);
int sadb_update(struct sadb_msg *);
int sadb_add(struct sadb_msg *, struct sadb_msg **);
int sadb_delete(struct sadb_msg *);
int sadb_get(struct sadb_msg *, struct sadb_msg **);
int sadb_dump(struct sadb_msg *, struct sadb_msg **);
```

## See Also

- `sys/netipsec/` - Kernel IPsec
- `usr.sbin/setkey/` - Uses libipsec