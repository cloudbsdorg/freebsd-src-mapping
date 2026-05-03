# Component: kern_acct.c

**Path:** `sys/kern/kern_acct.c`
**Type:** File
**Maps to:** `.discovery/sys/kern/kern_acct.md`

## Purpose

Process accounting - records process resource usage to a file for billing and monitoring. Implements the acct() syscall which enables/disables process accounting and the accounting daemon that writes records.

## Structure

```mermaid
graph LR
    A[sys_acct - syscall] --> B[acct_thread kthread]
    B --> C[acct_vp - accounting file]
    C --> D[acct_process - per-process record]
    D --> E[acct_write - write to disk]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sys_acct` | Main syscall to enable/disable accounting | `int sys_acct(struct thread *td, struct acct_args *uap)` |
| `acct_thread` | Kernel thread that writes accounting records | `static void acct_thread(void *arg)` |
| `acct_disable` | Disable accounting | `static int acct_disable(struct thread *td, int fd)` |
| `acct_process` | Called on process exit to record usage | `void acct_process(struct proc *p)` |
| `acct_write` | Write accounting record to file | `static int acct_write(struct proc *p, struct ucred *cred)` |
| `encode_timeval` | Encode timeval to accounting format | `static uint32_t encode_timeval(struct timeval tv)` |
| `encode_long` | Encode long to floating point | `static uint32_t encode_long(long v)` |

## Data Structures

| Structure | Purpose |
|-----------|---------|
| `struct acctv3` | Accounting record format (IEEE-754 float-based) |
| `struct acctv2` | Legacy accounting record format |
| `acct_vp` | Vnode of accounting file |
| `acct_sx` | Sleep lock protecting accounting state |

## Includes

- `sys/proc.h` - Process structures
- `sys/acct.h` - Accounting structures
- `sys/vnode.h` - Vnode operations
- `sys/mount.h` - Filesystem mount points
- `sys/syscalls.h` - System call definitions

## Depends On

- Used by `kern_exit.c` for process termination accounting
- `sys/proc.c` for process lifecycle integration