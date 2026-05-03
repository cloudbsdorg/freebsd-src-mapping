# lib/libc_r/ — Reentrant C Library Codebase Map

**Path:** `lib/libc_r/`
**Purpose:** libc with thread support (legacy)

## Overview

libc_r was a thread-aware version of libc. Now mostly obsolete as libc is thread-safe.

## Status

**DEPRECATED** - Modern FreeBSD uses libthr or libpthread instead.

## Key Files

| File | Purpose |
|------|---------|
| `uthread/` | User threads |
| `io/` | Threaded I/O |

## Replacement

- `lib/libc/` - Thread-safe by default
- `lib/libthr/` - GNU pthreads

## See Also

- `lib/libc/` - Standard C library
- `lib/libthr/` - POSIX threads