# lib/libvmmapi/ — Virtual Machine Monitor API Codebase Map

**Path:** `lib/libvmmapi/`
**Purpose:** Userland VMM library

## Overview

libvmmapi provides the userland API for the BSD Hyper-V (bhyve).

## Key Files

| File | Purpose |
|------|---------|
| `libvmmapi.h` | Header |
| `vmmapi.c` | Main |

## Key Functions

```c
int vmmapi_init(struct vmctx **);
void vmmapi_cleanup(struct vmctx *);

int vm_getmemorysize(struct vmctx *, uint64_t *);

int vm_run(struct vmctx *, int, struct vm_exit *);
int vm_suspend(struct vmctx *, int);

int vm_inject_int(struct vmctx *, int);
int vm_inject_nmi(struct vmctx *);

int vm_get_register(struct vmctx *, int, int, uint64_t *);
int vm_set_register(struct vmctx *, int, int, uint64_t);

int vm_get_seg(struct vmctx *, int, int, struct vm_segment *);
int vm_set_seg(struct vmctx *, int, int, struct vm_segment *);
```

## Structures

```c
struct vmctx {
    int fd;
    char *path;
};

struct vm_exit {
    int vcpu;
    int exit_reason;
    union {
        struct vm_exit_entry {
            uint64_t rip;
            uint64_t inst_length;
        } entry;
        struct vm_exit_debug {
            uint64_t rip;
        } debug;
    };
};
```

## See Also

- `usr.sbin/bhyve/` - Uses libvmmapi