# Component: sched_4bsd.c

**Path:** `sys/kern/sched_4bsd.c`
**Type:** File
**Maps to:** `.discovery/sys/kern/sched_4bsd.md`

## Purpose

4.4BSD O(1) scheduler - the traditional BSD process scheduler. Uses fixed priorities with multiple run queues for O(1) dispatch.

## Structure

```mermaid
flowchart TD
    A[sched_4bsd - init] --> B[setup queues]
    B --> C[sched_add - enqueue]
    C --> D[insert by priority]
    E[sched_pri - set priority] --> F[update queue]
    G[sched_switch - dispatch] --> H[O(1) pick]
    H --> I[run next thread]
```

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `sched_4bsd_init` | Initialize | `void sched_4bsd_init(void)` |
| `sched_4bsd_add` | Add to queue | `void sched_4bsd_add(struct thread *td)` |
| `sched_4bsd_rem` | Remove | `void sched_4bsd_rem(struct thread *td)` |
| `sched_4bsd_pickcpu` | Pick CPU | `cpuset_t sched_4bsd_pickcpu(struct thread *td)` |
| `sched_4bsd_setpri` | Set priority | `void sched_4bsd_setpri(struct thread *td, u_char pri)` |

## Priority Classes

| Class | Range | Description |
|-------|-------|-------------|
| `PUSER` | 0-127 | User priorities |
| `PSWP` | 128 | Swapper |
| `PVM` | 129 | Virtual memory |
| `PIDLE` | 255 | Idle |

## Run Queues

| Queue | Description |
|-------|-------------|
| `9 run queues` | One per priority class |
| `runticks` | Time slice tracking |

## Scheduler Hooks

| Hook | Description |
|------|-------------|
| `sched_add` | Add thread |
| `sched_rem` | Remove thread |
| `sched_pri` | Set priority |

## Time Slice

| Parameter | Description |
|-----------|-------------|
| `schedtick` | Ticks per slice |
| `runticks` | Remaining |

## Includes

- `sys/sched.h` for scheduler definitions

## Depends On

- `sys/proc.h` for process
- `machine/smp.h` for SMP