# sys/libkern/ — Kernel Library Codebase Map

**Path:** `sys/libkern/`
**Files:** 71 C source files
**Purpose:** Kernel utility library - string, memory, math, hash, network utilities

## Overview

libkern provides a standard C library implementation for the kernel. All kernel code uses these functions instead of userland libc. Functions here must be written to not page fault, allocate memory, or call blocking operations.

## String Functions

| File | Function | Purpose |
|------|----------|---------|
| `strlen.c` | `strlen()` | String length |
| `strcpy.c` | `strcpy()` | String copy |
| `strncpy.c` | `strncpy()` | Bounded copy |
| `strcat.c` | `strcat()` | String concat |
| `strncat.c` | `strncat()` | Bounded concat |
| `strcmp.c` | `strcmp()` | String compare |
| `strncmp.c` | `strncmp()` | Bounded compare |
| `strdup.c` | `strdup()` | String duplicate |
| `strndup.c` | `strndup()` | Bounded duplicate |
| `strchr.c` | `strchr()` | Find char |
| `strrchr.c` | `strrchr()` | Find char (reverse) |
| `strstr.c` | `strstr()` | Find substring |
| `strcasestr.c` | `strcasestr()` | Case-insensitive find |
| `strnstr.c` | `strnstr()` | Bounded substring find |
| `strspn.c` | `strspn()` | Skip set |
| `strcspn.c` | `strcspn()` | Skip complement |
| `strsep.c` | `strsep()` | Split string |
| `strtol.c` | `strtol()` | String to long |
| `strtoul.c` | `strtoul()` | String to ulong |
| `strtoll.c` | `strtoll()` | String to long long |
| `strtoull.c` | `strtoull()` | String to ulong long |
| `strtouq.c` | `strtouq()` | String to u_quad_t |
| `strtoq.c` | `strtoq()` | String to quad_t |
| `strcasecmp.c` | `strcasecmp()` | Case-insensitive compare |
| `strnlen.c` | `strnlen()` | Bounded string length |
| `strlcpy.c` | `strlcpy()` | Safe copy (BSD) |
| `strlcat.c` | `strlcat()` | Safe concat (BSD) |
| `strchrnul.c` | `strchrnul()` | Find char or null |
| `strvalid.c` | `strvalid()` | Validate string |
| `scanc.c` | `scanc()` | Skip characters |

**Key Implementation Notes:**
- All functions are reentrant unless noted
- No locking required (no global state)
- Optimized for inlining in kernel

## Memory Functions

| File | Function | Purpose |
|------|----------|---------|
| `memcpy.c` | `bcopy()` | Block copy |
| `memmove.c` | `memmove()` | Copy with overlap |
| `memset.c` | `memset()` | Fill memory |
| `memcmp.c` | `memcmp()` | Compare memory |
| `memchr.c` | `memchr()` | Find byte |
| `memcchr.c` | `memcchr()` | Find byte (reverse) |
| `memmem.c` | `memmem()` | Find pattern |
| `bcopy.c` | `bcopy()` | Copy bytes |
| `explicit_bzero.c` | `explicit_bzero()` | Clear sensitive data |

**Memory Alignment:**
```c
// Alignment helpers
#define MEM_ALIGN(size)     ((size + sizeof(long) - 1) & ~(sizeof(long) - 1))
#define MEM_ALIGN_PTR(ptr)  ((void *)MEM_ALIGN((uintptr_t)(ptr)))
```

## Math Functions (Integer Arithmetic)

### Division Operations

| File | Function | Operation |
|------|----------|-----------|
| `divdi3.c` | `divdi3()` | 64-bit signed divide |
| `divmoddi4.c` | `divmoddi4()` | 64-bit signed divide+mod |
| `udivdi3.c` | `udivdi3()` | 64-bit unsigned divide |
| `udivmoddi4.c` | `udivmoddi4()` | 64-bit unsigned divide+mod |
| `umoddi3.c` | `umoddi3()` | 64-bit unsigned modulo |
| `moddi3.c` | `moddi3()` | 64-bit signed modulo |

### Shift Operations

| File | Function | Operation |
|------|----------|-----------|
| `ashldi3.c` | `ashldi3()` | Arithmetic shift left (DI) |
| `lshrdi3.c` | `lshrdi3()` | Logical shift right (DI) |
| `ashrdi3.c` | `ashrdi3()` | Arithmetic shift right (DI) |

### Comparison & Conversion

| File | Function | Operation |
|------|----------|-----------|
| `cmpdi2.c` | `cmpdi2()` | Compare signed DI |
| `ucmpdi2.c` | `ucmpdi2()` | Compare unsigned DI |
| `ffs.c` | `ffs()` | Find first set bit |
| `ffsdi2.c` | `ffsdi2()` | Find first set (DI) |

### 128-bit Division Support

```c
// quad_t division support
qdivrem_t qdivrem(u_long a, u_long b, u_long *rem);
```

## Hash Functions

| File | Function | Purpose |
|------|----------|---------|
| `murmur3_32.c` | `murmur3_32()` | MurmurHash3 (32-bit) |
| `jenkins_hash.c` | `jenkins_hash()` | Bob Jenkins hash |
| `gsb_crc32.c` | `gsb_crc32()` | CRC32 (GHash) |
| `crc16.c` | `crc16()` | CRC16 |

**Usage:**
```c
// Hash table initialization
u_int32_t hash = jenkins_hash(key, keylen, initial);
```

## Random Number Generation

| File | Function | Purpose |
|------|----------|---------|
| `random.c` | `random()` | LCG random (legacy) |
| `arc4random.c` | `arc4random()` | RC4-based random |
| `arc4random_uniform.c` | `arc4random_uniform()` | Uniform distribution |

**arc4random Features:**
- ChaCha20-based for modern systems
- Self-seeding (no explicit seed needed)
- Thread-safe
- Non-blocking

## Network Address Functions

| File | Function | Purpose |
|------|----------|---------|
| `inet_aton.c` | `inet_aton()` | ASCII to IP (v4) |
| `inet_ntoa.c` | `inet_ntoa()` | IP to ASCII (v4) |
| `inet_ntop.c` | `inet_ntop()` | IP to string (v4/v6) |
| `inet_pton.c` | `inet_pton()` | String to IP (v4/v6) |

**Note:** These are kernel-specific implementations for inet_ntop/inet_pton.

## Iconv (Character Set Conversion)

| File | Function | Purpose |
|------|----------|---------|
| `iconv.c` | `iconv()` | Generic iconv |
| `iconv_ucs.c` | `iconv_ucs_*()` | UCS conversions |
| `iconv_lat1.c` | `iconv_lat1_*()` | Latin-1 |
| `iconv_646.c` | `iconv_646_*()` | ASCII/646 |
| `iconv_utf8.c` | `iconv_utf8_*()` | UTF-8 |
| `iconv_vis.c` | `iconv_vis_*()` | Visibly encoded |
| `iconv_xlate.c` | `iconv_xlate_*()` | Translation tables |

## Sorting & Searching

| File | Function | Purpose |
|------|----------|---------|
| `qsort.c` | `qsort()` | Quick sort |
| `qsort_r.c` | `qsort_r()` | Reentrant qsort |
| `bsearch.c` | `bsearch()` | Binary search |

## Other Utilities

| File | Function | Purpose |
|------|----------|---------|
| `fnmatch.c` | `fnmatch()` | Glob pattern matching |
| `asprintf.c` | `asprintf()` | Print to allocated string |
| `bcd.c` | `bcd()` | Binary-coded decimal |
| `timingsafe_bcmp.c` | `timingsafe_bcmp()` | Constant-time compare |

## Kernel-Specific Constraints

All libkern functions must satisfy:

1. **No blocking** - Cannot sleep or wait for resources
2. **No dynamic allocation** - Cannot call malloc/vmalloc
3. **No page faults in critical paths** - Must be kernel-resident
4. **Reentrant** - Safe to call from interrupt context
5. **No filesystem access** - Cannot access VFS

```c
// Example: Safe kernel function
int
kernel_strcmp(const char *s1, const char *s2)
{
    while (*s1 == *s2) {
        if (*s1 == '\0')
            return (0);
        s1++;
        s2++;
    }
    return (*(unsigned char *)s1 - *(unsigned char *)s2);
}
```

## Relationship to Userland libc

```
userland: libc.a / libc.so
    │
    │  Same interface, kernel-safe implementations
    ▼
kernel: sys/libkern/libkern.a
```

- Function signatures match POSIX/ISO C
- Implementations optimized for kernel environment
- No userland-specific features (stdio, file I/O, etc.)

## Key Dependencies

```c
#include <sys/libkern.h>    // Main header
#include <sys/systm.h>      // Kernel definitions
```

## Debugging Support

libkern provides:
- `KASSERT()` macros
- `panic()` function
- `printf()` variants (without floating point)

## See Also

- `sys/kern/kern_malloc.c` - Kernel memory allocator
- `sys/kern/subr_prf.c` - Printf implementation
- `sys/sys/libkern.h` - Public interface