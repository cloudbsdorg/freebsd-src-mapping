# Component: in_fib_algo.c

**Path:** `sys/netinet/in_fib_algo.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_fib_algo.md`

## Purpose

FIB algorithm - routing lookup algorithms for IPv4.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `fib_algo` | Lookup | `void *fib_algo_lookup(struct fib_lookup_arg *flarg)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `fib` | Forwarding information base |
| `lpm` | Longest prefix match |

## Includes

- `netinet/in_fib.h` - FIB definitions