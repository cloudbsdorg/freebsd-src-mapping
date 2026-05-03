# usr.bin/grep/ — Grep Codebase Map

**Path:** `usr.bin/grep/`
**Purpose:** Pattern matching

## Overview

grep searches for patterns in files.

## Key Files

| File | Purpose |
|------|---------|
| `grep.c` | Main |
| `cmp.c` | Compare |
| `queue.c` | Queue |
| `trim.c` | Trim |

## Key Functions

```c
int grep(struct qstuff *, regex_t *);
int grepbin(struct qstuff *, regex_t *, struct iovec *);
```

## See Also

- `contrib/grep/` - Source