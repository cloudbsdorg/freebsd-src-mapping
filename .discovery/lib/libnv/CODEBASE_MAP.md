# lib/libnv/ — Configuration Library Codebase Map

**Path:** `lib/libnv/`
**Purpose:** Name-value pair configuration

## Overview

libnv provides a simple name-value pair configuration library.

## Key Files

| File | Purpose |
|------|---------|
| `libnv.h` | Header |
| `libnv.c` | Main |

## Key Functions

```c
nvlist_t *nvlist_create(int flags);
void nvlist_destroy(nvlist_t *nvl);

void nvlist_add_string(nvlist_t *, const char *, const char *);
void nvlist_add_number(nvlist_t *, const char *, uint64_t);
void nvlist_add_boolean(nvlist_t *, const char *, bool);
void nvlist_add_binary(nvlist_t *, const char *, const void *, size_t);

const char *nvlist_get_string(const nvlist_t *, const char *);
uint64_t nvlist_get_number(const nvlist_t *, const char *);
bool nvlist_get_boolean(const nvlist_t *, const char *);

char *nvlist_dump_xml(const nvlist_t *, size_t *);
nvlist_t *nvlist_parse_xml(const char *, size_t, int *);
```

## See Also

- `sys/sys/nv.h` - Kernel version