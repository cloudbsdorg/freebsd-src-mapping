# lib/libedit/ — Edit Line Library Codebase Map

**Path:** `lib/libedit/`
**Purpose:** Line editing and terminal UI

## Overview

libedit provides a line editing interface similar to GNU readline.

## Key Files

| File | Purpose |
|------|---------|
| `editline.c` | Main |
| `readline.c` | Readline compat |
| `terminal.c` | Terminal |
| `el_term.c` | Terminal setup |
| `el_winsize.c` | Window size |
| `el_parse.c` | Parsing |
| `el_comp.c` | Completion |
| `el_history.c` | History |
| `el_tokenize.c` | Tokenize |
| `strlcpy.c` | String copy |

## Key Functions

```c
typedef struct lineinfo {
    const char *buffer;
    size_t length;
    size_t offset;
} lineinfo;

const char *readline(const char *prompt);

int el_init(const char *, FILE *, FILE *, FILE *);
void el_end(void);
int el_set(ELE *, int, ...);
int el_get(ELE *, int, void *);
int el_line(ELE *, lineinfo_t *);
int el_insert_str(ELE *, const char *);
int el_deletestr(ELE *, int);
char *el_gets(ELE *, int *);
```

## Completion

```c
typedef char *(*completion_func_t)(const char *, int);
int el_set(ELE *, EL_ADDFN, const char *, const char *,
    completion_func_t);
```

## See Also

- `usr.bin/ed/` - Editor using libedit
- `lib/libreadline/` - GNU readline