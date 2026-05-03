# lib/libnet/ — Network Utility Library Codebase Map

**Path:** `lib/libnet/`
**Purpose:** Network utilities

## Overview

libnet provides network utility functions.

## Key Files

| File | Purpose |
|------|---------|
| `net.c` | Main |
| `net.h` | Header |

## Key Functions

```c
char *inet_net_ntop(int, const void *, int, char *, size_t);
int inet_net_pton(int, const char *, void *, size_t);

int inet_neta(uint32_t, char *, size_t);
char *inet_ntoa_r(uint32_t, char *);
uint32_t inet_addrnet(const char *, int *);
```

## See Also

- `lib/libc/` - libc network