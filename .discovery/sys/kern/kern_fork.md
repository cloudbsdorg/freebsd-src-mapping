# sys/kern/kern_fork.c — Process Forking Codebase Map

**Path:** `sys/kern/kern_fork.c`
**Purpose:** Process and thread creation via fork

## File Overview

Implements fork, vfork, rfork, and pdfork system calls. Handles process creation, PID allocation, address space copying, and thread initialization.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sys_fork()` | Standard fork syscall | `int sys_fork(struct thread *td, struct fork_args *uap)` |
| `sys_vfork()` | vfork syscall | `int sys_vfork(struct thread *td, struct vfork_args *uap)` |
| `sys_rfork()` | rfork syscall | `int sys_rfork(struct thread *td, struct rfork_args *uap)` |
| `sys_pdfork()` | Process descriptor fork | `int sys_pdfork(struct thread *td, struct pdfork_args *uap)` |
| `fork1()` | Core fork implementation | `int fork1(struct thread *td, struct fork_req *fr)` |
| `do_fork()` | Actual fork work | `static void do_fork(struct thread *td, struct fork_req *fr, struct proc *p2, struct thread *td2, struct vmspace *vm2, struct file *fp_procdesc)` |
| `fork_findpid()` | Find unused PID | `static int fork_findpid(int flags)` |
| `fork_exit()` | Handle child return | `void fork_exit(void (*callout)(void *, struct trapframe *), void *arg, struct trapframe *frame)` |
| `fork_return()` | Syscall return for child | `void fork_return(struct thread *td, struct trapframe *frame)` |

## Fork Flags

| Flag | Meaning |
|------|---------|
| `RFPROC` | Create new process (not just thread) |
| `RFFDG` | Copy file descriptors |
| `RFCFDG` | Close file descriptors in child |
| `RFPPWAIT` | Parent waits for child exec/exit |
| `RFMEM` | Share memory (vfork) |
| `RFTHREAD` | Create thread not process |
| `RFSTOPPED` | Create process stopped |
| `RFPROCDESC` | Return process descriptor |
| `RFNOWAIT` | Child reparented to init |

## Process Creation Flow

```mermaid
flowchart TD
    A[sys_fork] --> B[fork1]
    B --> C[Check limits - nprocs maxproc]
    C --> D[fork_findpid - allocate PID]
    D --> E[uma_zalloc proc_zone - allocate proc struct]
    E --> F[thread_alloc - allocate thread]
    F --> G[do_fork]
    G --> H[vm_forkproc - copy VM]
    H --> I[Copy file descriptors, signal handlers]
    I --> J[sched_fork - setup scheduler]
    J --> K[Insert into process lists]
    K --> L[Either stop or schedule child]
    L --> M[fork_exit called in child]
    M --> N[userret returns to userland]
```

## fork1() Validation

```mermaid
flowchart TD
    A[fork1] --> B{Flags & RFPROC?}
    B -->|No| C[fork_norfproc - thread only]
    B -->|Yes| D{Exceeds maxproc?}
    D -->|Yes| E[Return EAGAIN]
    D -->|No| F{Multi-threaded?}
    F -->|Yes| G[thread_single - stop other threads]
    F -->|No| H[Continue]
    G --> H
    H --> I[Allocate proc via uma_zalloc]
    I --> J[vmspace_fork - copy address space]
    J --> K[do_fork - setup child]
```

## PID Allocation

- Uses `lastpid` counter with randomization via `randompid` sysctl
- Checks pid_max limit
- Uses bitmaps: `proc_id_pidmap`, `proc_id_grpidmap`, `proc_id_sessidmap`, `proc_id_reapmap`
- Finds first unused PID starting from lastpid + 1

## Key Includes

```mermaid
flowchart LR
    kern_fork["kern_fork.c"] --> proc["sys/proc.h"]
    kern_fork --> vm_map["vm/vm_map.h"]
    kern_fork --> sched["sys/sched.h"]
    kern_fork --> filedesc["sys/filedesc.h"]
    kern_fork --> signal["sys/signalvar.h"]
```

## Key Dependencies

| File | Purpose |
|------|---------|
| `vm_vmspace.c` | vmspace_fork() for copying VM |
| `sys_fork.c` | Machine-dependent fork |
| `thread_stoch.c` | Scheduler fork hooks |
| `proc.c` | Process list management |
| `filedesc.c` | File descriptor copying |