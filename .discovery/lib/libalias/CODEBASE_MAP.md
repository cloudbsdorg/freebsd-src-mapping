# lib/libalias/ — Packet Aliasing Library Codebase Map

**Path:** `lib/libalias/`
**Purpose:** Network address translation (NAT)

## Overview

libalias provides packet aliasing for NAT/redirect services.

## Key Files

| File | Purpose |
|------|---------|
| `libalias.c` | Main |
| `libalias.h` | Header |
| `alias.c` | Aliasing |
| `alias_db.c` | Database |
| `alias_local.c` | Local |
| `server.c` | Server |

## Key Functions

```c
struct alias_link *AddLink(struct alias_data *);
int DeleteLink(struct alias_link *);
void *FindLink(struct in_addr, struct in_addr, int, int, int);

int AliasIn(struct alias_link *, struct ip *);
int AliasOut(struct alias_link *, struct ip *);

struct in_addr GetAliasAddress(struct alias_link *);
uint16_t GetAliasPort(struct alias_link *);
```

## Protocols

- `alias_ftp.c` - FTP
- `alias_irc.c` - IRC
- `alias_pptp.c` - PPTP
- `alias_sip.c` - SIP
- `alias_skinny.c` - Skinny
- `alias_usrlib.c` - Userspace

## See Also

- `sys/netinet/libalias/` - Kernel aliasing