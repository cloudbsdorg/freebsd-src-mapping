# Component: tcp_syncache.c

**Path:** `sys/netinet/tcp_syncache.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/tcp_syncache.md`

## Purpose

TCP syncache - SYN cookie and incomplete connection state cache.

## Structure

```mermaid
flowchart TD
    A[syncache] --> B[syncache_add]
    A --> C[syncache_lookup]
    A --> D[syncache_expire]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `syncache_add` | Add | `int syncache_add(struct inpcb *inp, ...)` |
| `syncache_lookup` | Lookup | `struct syncache *syncache_lookup(...)` |
| `syncache_expire` | Expire | `void syncache_expire(void)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP protocol |
| `syncache` | SYN cache |
| `syncookie` | SYN cookies |

## Includes

- `netinet/tcp_var.h` - TCP variables