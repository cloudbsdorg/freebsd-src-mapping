# sys/compat/ — Compatibility Layers Codebase Map

**Path:** `sys/compat/`
**Purpose:** Linux emulation, FreeBSD32, and other compatibility layers

## Overview

The compat directory provides compatibility layers for running binaries from other systems and architectures.

## FreeBSD32 (32-bit on 64-bit)

| Directory | Purpose |
|-----------|---------|
| `freebsd32/` | 32-bit emulation on 64-bit |

### FreeBSD32 Files

| File | Purpose |
|------|---------|
| `freebsd32/` | 32-bit syscall handlers |

### FreeBSD32 Syscall Handling

```c
// 32-bit syscall wrapper
struct freebsd32_sigframe {
    int             sf_signo;
    int             sf_code;
    struct sigcontext sf_sigctx;
};
```

## IA32 Compatibility

| Directory | Purpose |
|-----------|---------|
| `ia32/` | IA-32 (32-bit x86) compatibility |

## Linux Emulation

| Directory | Purpose |
|-----------|---------|
| `linux/` | Linux binary emulation |
| `linuxkpi/` | Linux Kernel Programming Interface |

### Linux Files

| File | Purpose |
|------|---------|
| `linux/linux_sysvec.c` | Linux syscall vector |
| `linux/linvec.S` | Linux syscall entry |

### Linux Syscall Numbers

```c
// Linux syscall numbers (subset)
#define LINUX_sys_exit         1
#define LINUX_sys_fork         2
#define LINUX_sys_read         3
#define LINUX_sys_write        4
#define LINUX_sys_open         5
#define LINUX_sys_close        6
// ... many more
```

### Linux Kernel Interface (linuxkpi/)

| File | Purpose |
|------|---------|
| `linuxkpi/` | Linux kernel API stubs |

Provides Linux kernel symbols to kernel modules:
- `sched_setscheduler()`
- `set_current_state()`
- `kmalloc()/kfree()`
- `container_of()`
- `spin_lock_init()`
- etc.

### Linux Filesystems

| Directory | Purpose |
|-----------|---------|
| `linprocfs/` | Linux /proc filesystem |
| `linsysfs/` | Linux /sys filesystem |
| `lindebugfs/` | Linux debugfs |

## x86 BIOS Emulation

| Directory | Purpose |
|-----------|---------|
| `x86bios/` | x86 real-mode BIOS emulation |

### x86BIOS Files

| File | Purpose |
|------|---------|
| `x86bios/x86bios.c` | x86 BIOS emulator |
| `x86bios/x86bios.h` | BIOS structures |

### BIOS Structures

```c
// Real-mode interrupt
struct x86_intr_handlers {
    void    (*handler)(void);      // Handler
    u_int16_t    cs;               // Code segment
    u_int16_t    ip;               // Instruction pointer
};

// BIOS Data Area
struct x86_bda {
    u_int16_t    com1_base;        // COM1 port
    u_int16_t    com2_base;        // COM2 port
    u_int16_t    lpt1_base;        // LPT1 port
    u_int8_t     bios_version;      // BIOS version
    // ... more
};
```

## Compatibility Syscalls

### Linux Binary Compatibility

```c
// Enable Linux binary compatibility
sysctl -w compat.linux.osrelease=5.10
```

### FreeBSD32 Binary Compatibility

```c
// Enable 32-bit on 64-bit
sysctl -w compat.freebsd32=1
```

## ioctl Compatibility

```c
// Device ioctl translation
int linux_ioctl(struct file *fp, u_long cmd, caddr_t data);
int freebsd32_ioctl(struct file *fp, u_long cmd, caddr_t data);
```

## Signal Translation

```c
// Signal mapping between Linux and FreeBSD
static const int linux_to_freebsd_signal[] = {
    [LINUX_SIGHUP] = SIGHUP,
    [LINUX_SIGINT] = SIGINT,
    // ... etc
};
```

## Key Dependencies

```c
#include <sys/mount.h>               // Filesystems
#include <sys/sysent.h>             // Syscalls
#include <compat/linux/linux.h>     // Linux
#include <compat/freebsd32/freebsd32.h> // FreeBSD32
```

## See Also

- `sys/amd64/linux32/` - Linux on AMD64
- `sys/i386/linux/` - Linux on i386
- `sys/kern/uipc_socket.c` - Socket compatibility