# Component: in_fib.c

**Path:** `sys/netinet/in_fib.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_fib.md`

## Purpose

INET FIB - Forwarding Information Base for IPv4.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `fib4_lookup` | Lookup | `struct nhop_object *fib4_lookup(struct fib_lookup_arg *arg)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `inet` | IPv4 |
| `fib` | Forwarding information base |

## Includes

- `netinet/in_fib.h` - FIB definitions