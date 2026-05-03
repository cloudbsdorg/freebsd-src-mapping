# include/ — System Headers Codebase Map

**Path:** `include/`
**Purpose:** System-wide header files

## Overview

The include directory contains top-level system headers.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `sys/` | System definitions |
| `machine/` | Architecture headers |
| `netinet/` | Internet protocols |
| `net/` | Network headers |

## Key Headers

```c
#include <sys/types.h>    // Basic types
#include <sys/cdefs.h>   // Compiler definitions
#include <sys/errno.h>   // Error numbers
#include <sys/time.h>    // Time structures
#include <sys/uio.h>     // I/O vectors
```

## See Also

- `sys/sys/` - Kernel headers
- `sys/kern/` - Kernel source