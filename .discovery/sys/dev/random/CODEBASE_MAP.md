# sys/dev/random/ — Random Number Generator Codebase Map

**Path:** `sys/dev/random/`
**Purpose:** Kernel entropy source

## Overview

The random device provides kernel random number generation.

## Key Files

| File | Purpose |
|------|---------|
| `randomdev.c` | Device |
| `random_harvestq.c` | Harvest queue |
| `random_yarrow.c` | Yarrow |

## Algorithms

| Algorithm | Description |
|-----------|-------------|
| Yarrow | Default |
| ChaCha20 | Fast |
| NIST SP800-90 | DRBG |

## Key Functions

```c
void random_harvest(void *, u_int, u_int);
void random_yarrow_init(void);
int random_yarrow_read(u_char *, u_int);
```

## See Also

- `lib/librandom/` - Userland random