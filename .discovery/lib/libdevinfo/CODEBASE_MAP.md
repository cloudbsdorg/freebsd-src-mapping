# lib/libdevinfo/ — Device Information Library Codebase Map

**Path:** `lib/libdevinfo/`
**Purpose:** Access device information

## Overview

libdevinfo provides access to device tree information.

## Key Files

| File | Purpose |
|------|---------|
| `libdevinfo.c` | Main |
| `devinfo.h` | Header |
| `devinfo_util.c` | Utils |

## Key Functions

```c
int di_walk_driver(char *, int, void *, int (*)(di_driver_t, void *));
int di_walk_node(char *, int, void *, int (*)(di_node_t, void *));
int di_walk_minor(char *, int, void *, int (*)(di_minor_t, void *));

di_node_t di_init(char *, int);
void di_fini(di_node_t);

char *di_driver_name(di_driver_t);
di_node_t di_parent(di_node_t);
di_node_t di_child(di_node_t);
```

## See Also

- `sys/dev/` - Device drivers