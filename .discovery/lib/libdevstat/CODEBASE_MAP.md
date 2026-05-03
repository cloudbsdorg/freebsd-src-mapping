# lib/libdevstat/ — Device Statistics Library Codebase Map

**Path:** `lib/libdevstat/`
**Purpose:** Device I/O statistics

## Overview

libdevstat provides device I/O statistics.

## Key Files

| File | Purpose |
|------|---------|
| `devstat.c` | Main |
| `devstat.h` | Header |

## Key Functions

```c
int devstat_getdevs(struct devstat *);
int devstat_get_generation(void);
int devstat_start_event(void);
int devstat_end_event(int);

struct devstat *devstat_get_device_by_alias(const char *);
struct devstat *devstat_get_device(int);
int devstat_compute_statistics(struct devstat *, void *, int, ...);
```

## See Also

- `usr.bin/iostat/` - Uses libdevstat