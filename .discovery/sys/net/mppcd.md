# Component: mppcd.c

**Path:** `sys/net/mppcd.c`
**Type:** File
**Maps to:** `.discovery/sys/net/mppcd.md`

## Purpose

MPPC decompression - Microsoft Point-to-Point Compression decompression module.

## Structure

```mermaid
flowchart TD
    A[mppcd] --> B[getbits]
    A --> C[mppc_decomp]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `getbits` | Get bits | `static uint32_t getbits(const uint8_t *buf, const uint32_t n, uint32_t *i, uint32_t *l)` |
| `mppc_decomp` | Decompress | `int mppc_decomp(struct mbuf *m, int boff, struct mpppc **state)` |

## MPPC

| Item | Description |
|------|-------------|
| `MPPC` | Microsoft Point-to-Point Compression |
| `HIST_LEN` | History buffer length (8192) |

## Use Cases

| Use | Description |
|-----|-------------|
| `mppc` | Compression |
| `pptp` | PPTP tunneling |

## Includes

- `net/mppc.h` - MPPC definitions