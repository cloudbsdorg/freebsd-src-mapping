# lib/libkvm/ — Kernel VM Library Codebase Map

**Path:** `lib/libkvm/`
**Purpose:** Access kernel virtual memory

## Overview

libkvm provides access to kernel virtual memory.

## Key Files

| File | Purpose |
|------|---------|
| `kvm.c` | Main |
| `kvm.h` | Header |
| `kvm_proc.c` | Process |

## Key Functions

```c
kvm_t *kvm_open(const char *exec, const char *core, const char *swap, int flags, char *errbuf);
int kvm_close(kvm_t *);
char **kvm_getargv(const kvm_t *, const struct kinfo_proc *, int);
char **kvm_getenvv(const kvm_t *, const struct kinfo_proc *, int);
struct kinfo_proc *kvm_getprocs(kvm_t *, int, int, int *);
struct kinfo_proc *kvm_getprocv(kvm_t *);

int kvm_read(kvm_t *, u_long, void *, int);
int kvm_write(kvm_t *, u_long, const void *, int);
```

## See Also

- `sys/vm/` - VM subsystem