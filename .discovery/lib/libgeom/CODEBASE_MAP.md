# lib/libgeom/ — GEOM Library Codebase Map

**Path:** `lib/libgeom/`
**Purpose:** GEOM class library

## Overview

libgeom provides a userland library for working with GEOM.

## Key Files

| File | Purpose |
|------|---------|
| `geom.c` | Main |
| `geom_ctl.c` | Control |
| `geom_map.c` | Map |
| `geom_nops.c` | No-ops |
| `geom孩子在.c` | Classes |
| `geom_conf.c` | Config |

## Key Functions

```c
struct gclass *geom_lookup_class(const char *name);
struct ggeom *geom_lookup_by_name(const char *name);
struct gconfig *geom_get_config(struct ggeom *gp, const char *name);

int geom_get_tree(struct gmesh *mp);
int geom_stats_open(struct gstatfs **sp, int *nsp);
```

## Structures

```c
struct gmesh {
    LIST_HEAD(, gclass) lg_class;
};

struct gclass {
    char name[16];
    LIST_ENTRY(gclass) class;
    LIST_HEAD(, ggeom) geom;
};

struct ggeom {
    char name[16];
    struct gclass *class;
    LIST_ENTRY(ggeom) geom;
    LIST_HEAD(, gconfig) consumer;
    LIST_HEAD(, gprovider) provider;
};
```

## See Also

- `sys/geom/` - Kernel GEOM