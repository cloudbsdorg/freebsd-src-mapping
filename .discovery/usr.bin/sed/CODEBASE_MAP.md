# usr.bin/sed/ — Sed Editor Codebase Map

**Path:** `usr.bin/sed/`
**Purpose:** Stream editor

## Overview

sed is a stream editor for filtering and transforming text.

## Key Files

| File | Purpose |
|------|---------|
| `sed.h` | Header |
| `compile.c` | Compile |
| `execute.c` | Execute |
| `file.c` | File ops |
| `misc.c` | Misc |
| `main.c` | Main |
| `process.c` | Process |

## Key Functions

```c
int compile(char *, struct subversion *);
int execute(FILE *, struct subversion *);
```

## See Also

- `contrib/sed/` - Source