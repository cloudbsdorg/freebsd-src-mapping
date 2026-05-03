# Component: toeplitz.c

**Path:** `sys/net/toeplitz.c`
**Type:** File
**Maps to:** `.discovery/sys/net/toeplitz.md`

## Purpose

Toeplitz hash - RSS (Receive Side Scaling) hash function for packet distribution.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `toeplitz_hash` | Hash | `uint32_t toeplitz_hash(u_int keylen, const uint8_t *key, u_int datalen, const uint8_t *data)` |

## Use Cases

| Use | Description |
|-----|-------------|
| `rss` | Receive Side Scaling |
| `hash` | Packet hashing |

## Includes

- `net/toeplitz.h` - Toeplitz definitions
- `net/rss_config.h` - RSS config