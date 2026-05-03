# lib/libutil/ — Utility Library Codebase Map

**Path:** `lib/libutil/`
**Purpose:** General utility functions

## Overview

libutil provides various utility functions.

## Key Files

| File | Purpose |
|------|---------|
| `libutil.c` | Main |
| `libutil.h` | Header |
| `login_class.c` | Login class |
| `login_cap.c` | Login capabilities |
| `tty.c` | TTY functions |
| `pwent.c` | Password entry |
| `forkpty.c` | Fork pty |
| `hostid.c` | Host ID |
| `pidfile.c` | PID file |

## Key Functions

```c
int login_class_supported(void);
struct passwd *getpwnam_class(const char *, const char *);
char *user_from_uid(uid_t, int);

int tty_stdout(void);
int tty_argv(int, char *[]);

int pidfile(const char *);
void pidfile_remove(void);

int forkpty(int *, char *, struct termios *, struct winsize *);
```

## See Also

- `lib/libc/` - Standard C library