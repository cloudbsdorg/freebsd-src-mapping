# lib/libwrap/ — TCP Wrappers Library Codebase Map

**Path:** `lib/libwrap/`
**Purpose:** TCP wrappers access control

## Overview

libwrap provides TCP wrappers (hosts_access) functionality.

## Key Files

| File | Purpose |
|------|---------|
| `libwrap.c` | Main |
| `hosts_access.c` | Access check |
| `hosts_options.c` | Options |
| `rfc931.c` | RFC931 |

## Key Functions

```c
int hosts_access(struct request_info *);
int hosts_ctl(char *, char *, char *, char *);

void request_init(struct request_info *, ...);
void sa_local_addr(struct request_info *, struct sockaddr *);
void-from_fd(struct request_info *, int);
void-from_stdline(struct request_info *);

char *eval_client(struct request_info *);
char *eval_server(struct request_info *);
```

## Access Control Files

- `/etc/hosts.allow` - Allow rules
- `/etc/hosts.deny` - Deny rules

## Rule Format

```
daemon : client [: options]
```

## See Also

- `usr.sbin/tcpd/` - TCP wrapper daemon