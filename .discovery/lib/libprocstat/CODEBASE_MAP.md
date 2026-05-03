# lib/libprocstat/ — Process Statistics Library Codebase Map

**Path:** `lib/libprocstat/`
**Purpose:** Process information

## Overview

libprocstat provides detailed process information.

## Key Files

| File | Purpose |
|------|---------|
| `libprocstat.c` | Main |
| `procstat.h` | Header |
| `procstat_core.c` | Core info |
| `procstat_elf.c` | ELF info |
| `procstat_kstack.c` | Kernel stack |
| `procstat_mmap.c` | Memory map |
| `procstat_rlimit.c` | Resources |
| `procstat_sock.c` | Sockets |
| `procstat_vmspace.c` | VM space |

## Key Functions

```c
struct procinfo *procstat_get_procs(struct procstat *, unsigned int *count, int);
void procstat_free_procs(struct procstat *, struct procinfo *);

char **procstat_getargv(struct procstat *, struct procinfo *, unsigned int *count);
char **procstat_getenvv(struct procstat *, struct procinfo *, unsigned int *count);

struct kinfo_vmentry *procstat_get_vmmap(struct procstat *, struct procinfo *, unsigned int *count);
struct kinfo_file *procstat_get_files(struct procstat *, struct procinfo *, unsigned int *count);
```

## See Also

- `usr.bin/ps/` - Uses libprocstat