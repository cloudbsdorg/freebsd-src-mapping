# lib/libc/ — C Standard Library Codebase Map

**Path:** `lib/libc/`
**Purpose:** FreeBSD's C standard library implementation

## Overview

The libc directory contains the C standard library, organized by subsystem. Most source is in subdirectories.

## Directory Structure

### Standard C Functions (stdlib/, stdio/, string/)

| Directory | Purpose |
|-----------|---------|
| `stdio/` | Standard I/O (printf, scanf, fopen, etc.) |
| `stdlib/` | Standard utilities (malloc, exit, qsort, etc.) |
| `string/` | String functions (strlen, memcpy, strcpy, etc.) |
| `stdbit/` | C23 stdbit.h |

### Math & Floating Point

| Directory | Purpose |
|-----------|---------|
| `stdtime/` | Time functions |
| `quad/` | 128-bit integer arithmetic |
| `gdtoa/` | Float-to-ASCII conversion |
| `softfloat/` | Software floating point |

### System Calls (gen/, sys/)

| Directory | Purpose |
|-----------|---------|
| `gen/` | Generic system calls |
| `sys/` | System call wrappers |

### Networking (net/, inet/, resolv/)

| Directory | Purpose |
|-----------|---------|
| `net/` | Network utilities |
| `inet/` | IPv4 utilities |
| `resolv/` | DNS resolver |

### Database & Hashing (db/, regex/)

| Directory | Purpose |
|-----------|---------|
| `db/` | Berkeley DB |
| `regex/` | Regular expressions |

### RPC & XDR (rpc/)

| Directory | Purpose |
|-----------|---------|
| `rpc/` | SunRPC |
| `nfs/` | NFS (some in libc) |

### Locale & Internationalization (locale/, iconv/, nls/)

| Directory | Purpose |
|-----------|---------|
| `locale/` | Locale support |
| `iconv/` | Character set conversion |
| `nls/` | Native Language Support |

### Security (posix1e/, secure/, capability/)

| Directory | Purpose |
|-----------|---------|
| `posix1e/` | POSIX.1e ACLs |
| `secure/` | Secure memory functions |
| `capability/` | Capsicum |

### Architecture-Specific (aarch64/, amd64/, arm/, i386/, powerpc/, riscv/)

| Directory | Purpose |
|-----------|---------|
| `amd64/` | AMD64 assembly |
| `aarch64/` | ARM64 assembly |
| `i386/` | i386 assembly |
| `arm/` | ARM assembly |
| `powerpc/` | PowerPC assembly |
| `powerpc64/` | PowerPC64 assembly |
| `riscv/` | RISC-V assembly |

### Build System (csu/, Makefile*)

| Directory | Purpose |
|-----------|---------|
| `csu/` | C startup code |
| `Makefile*` | Build files |

## Key Source Files

### String Functions (string/)

```c
// string/strlen.c
size_t strlen(const char *s);

// string/strcmp.c
int strcmp(const char *s1, const char *s2);

// string/memcpy.c
void *memcpy(void *dest, const void *src, size_t n);
void *memmove(void *dest, const void *src, size_t n);

// string/strcpy.c
char *strcpy(char *dest, const char *src);
```

### Standard I/O (stdio/)

```c
// stdio/printf.c
int printf(const char *restrict format, ...);
int sprintf(char *str, const char *format, ...);
int snprintf(char *str, size_t size, const char *format, ...);

// stdio/fopen.c
FILE *fopen(const char *restrict filename, const char *restrict mode);
FILE *fdopen(int fd, const char *mode);

// stdio/vfprintf.c
int vfprintf(FILE *stream, const char *format, va_list ap);
```

### Memory (stdlib/)

```c
// stdlib/malloc.c
void *malloc(size_t size);
void free(void *ptr);
void *realloc(void *ptr, size_t size);
void *calloc(size_t nmemb, size_t size);

// stdlib/exit.c
void exit(int status);
void _Exit(int status);
```

### Process (gen/)

```c
// gen/fork.c
pid_t fork(void);

// gen/exec.c
int execve(const char *path, char *const argv[], char *const envp[]);

// gen/spawn.c
int posix_spawn(pid_t *pid, const char *path,
    const posix_spawn_file_actions_t *file_actions,
    const posix_spawnattr_t *attrp,
    char *const argv[], char *const envp[]);
```

### Thread (thread/)

```c
// thr/common/thr_rcompat.c
int thr_create(void *stack, size_t stacksize,
    void *(*start_func)(void *), void *arg, int flags, long *tid);
int thr_join(long tid, long *state, void **status);
int thr_exit(void *status);
```

### Networking (net/, inet/)

```c
// net/gethostbyname.c
struct hostent *gethostbyname(const char *name);

// inet/net/htons.c
uint16_t htons(uint16_t hostshort);
uint32_t htonl(uint32_t hostlong);

// resolv/res_query.c
int res_query(const char *name, int class, int type,
    u_char *answer, int anslen);
```

### DNS Resolver (resolv/)

```c
// resolv/res_init.c
int res_init(void);

// resolv/res_query.c
struct hostent *res_search(const char *dname, int class, int type,
    u_char *answer, int anslen);
```

### Regular Expressions (regex/)

```c
// regex/regexec.c
int regexec(const regex_t *preg, const char *string,
    size_t nmatch, regmatch_t pmatch[], int eflags);

// regex/regcomp.c
int regcomp(regex_t *preg, const char *pattern, int cflags);
```

## Startup Code (csu/)

```c
// csu/common/start.S
// Entry point for programs
void _start(void);

// csu/amd64/crt1.S
// AMD64 C runtime startup
```

## Linker Scripts

```c
// libc.ldscript
// Linker script for libc.so
```

## Build System

```makefile
# Makefile
SRCS=  string/strlen.c string/strcmp.c stdio/printf.c ...
OPSRC= string/strlen.c ...

.include <Makefile.inc>
.include <bsd.lib.mk>
```

## Important Headers

```c
#include <stdio.h>      // Standard I/O
#include <stdlib.h>     // Standard library
#include <string.h>     // String functions
#include <unistd.h>    // POSIX syscalls
#include <sys/types.h> // System types
#include <netinet/in.h> // INET sockets
#include <arpa/inet.h>  // inet_*
```

## See Also

- `lib/libc++/` - C++ standard library
- `lib/libc_nonshared/` - Parts not shared
- `lib/msun/` - Math library