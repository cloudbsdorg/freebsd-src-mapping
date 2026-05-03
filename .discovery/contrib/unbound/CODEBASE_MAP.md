# contrib/unbound/ — Unbound DNS Resolver Codebase Map

**Path:** `contrib/unbound/`
**Purpose:** DNS resolver library

## Overview

Unbound is a validating, recursive, and caching DNS resolver.

## Key Files

| File | Purpose |
|------|---------|
| `util/` | Utilities |
| `dnssec/` | DNSSEC |
| `validator/` | Validation |
| `iterator/` | Iterative query |
| `localzone/` | Local zones |
| `cachedb/` | Cache database |
| `ipsec/` | IPsec |

## Key Libraries

| Library | Purpose |
|---------|---------|
| `libunbound` | Main library |

## Key Functions

```c
int ub_init(void);
void ub_ctx_delete(struct ub_ctx *);
int ub_ctx_set_fwd(struct ub_ctx *, const char *);
int ub_ctx_add_ta(struct ub_ctx *, const char *);
int ub_resolve(struct ub_ctx *, const char *, int, int, struct ub_result **);
void ub_resolve_free(struct ub_result *);
```

## See Also

- `usr.sbin/unbound/` - Daemon