# lib/libsqlite3/ — SQLite Library Codebase Map

**Path:** `lib/libsqlite3/`
**Purpose:** SQLite embedded database

## Overview

libsqlite3 provides an embedded SQL database engine.

## Key Files

| File | Purpose |
|------|---------|
| `sqlite3.c` | Main source |
| `sqlite3.h` | Header |
| `sqlite3ext.h` | Extension header |

## Key Functions

```c
sqlite3 *sqlite3_open(const char *, sqlite3 **);
sqlite3 *sqlite3_open_v2(const char *, sqlite3 **, int, const char *);
int sqlite3_close(sqlite3 *);
int sqlite3_exec(sqlite3 *, const char *, int (*)(void *, int, char **, char **), void *, char **);

int sqlite3_prepare_v2(sqlite3 *, const char *, int, sqlite3_stmt **, const char **);
int sqlite3_step(sqlite3_stmt *);
int sqlite3_finalize(sqlite3_stmt *);
int sqlite3_reset(sqlite3_stmt *);

int sqlite3_bind_int(sqlite3_stmt *, int, int);
int sqlite3_bind_text(sqlite3_stmt *, int, const char *, int, void (*)(void *));
int sqlite3_column_int(sqlite3_stmt *, int);
const unsigned char *sqlite3_column_text(sqlite3_stmt *, int);
```

## Types

```c
typedef struct sqlite3 sqlite3;
typedef struct sqlite3_stmt sqlite3_stmt;
typedef int (*sqlite3_callback)(void *, int, char **, char **);
```

## See Also

- `usr.bin/sqlite3/` - CLI client