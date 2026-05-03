# Component: siftr.c

**Path:** `sys/netinet/siftr.c`
**Type:** File
**Maps to:** `.discovery/sys/netinet/siftr.md`

## Purpose

SIFTR - Statistical Information For TCP Research logging module.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `siftr_log` | Log | `void siftr_log(struct siftr_ctx *ctx, ...)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `tcp` | TCP research |
| `logging` | Statistics logging |

## Includes

- `netinet/siftr.h` - SIFTR definitions