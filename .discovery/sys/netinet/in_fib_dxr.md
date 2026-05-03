# Component: in_fib_dxr.c

**Path:** `sys/netinet/in_fib_dxr.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/in_fib_dxr.md`

## Purpose

DXR routing - DXR (Double eXpand Radix) longest prefix match.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `dxr_init` | Init | `int dxr_init(struct fib_info *fi)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `fib` | Forwarding information base |
| `lpm` | Longest prefix match |

## Includes

- `netinet/in_fib.h` - FIB definitions