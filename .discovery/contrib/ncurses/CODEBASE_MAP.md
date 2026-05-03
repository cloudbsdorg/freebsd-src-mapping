# contrib/ncurses/ — NCurses Terminal UI Library Codebase Map

**Path:** `contrib/ncurses/`
**Purpose:** Terminal UI library

## Overview

ncurses provides terminal-independent screen handling.

## Key Files

| File | Purpose |
|------|---------|
| `ncurses/` | Main ncurses |
| `panel/` | Panel library |
| `menu/` | Menu library |
| `form/` | Form library |
| `trace/` | Trace |

## Libraries

| Library | Purpose |
|---------|---------|
| `libncurses` | Main |
| `libpanel` | Panels |
| `libmenu` | Menus |
| `libform` | Forms |

## Key Functions

```c
// Window
WINDOW *initscr(void);
int endwin(void);
int refresh(void);
int doupdate(void);

// Output
int printw(const char *, ...);
int addch(const chtype);
int addstr(const char *);
int mvprintw(int, int, const char *, ...);

// Input
int getch(void);
int wgetch(WINDOW *);
char *wgetstr(WINDOW *, char *);

// Attributes
int attron(chtype);
int attroff(chtype);
int color_set(short, void *);

// Windows
WINDOW *newwin(int, int, int, int);
int delwin(WINDOW *);
int mvwin(WINDOW *, int, int);

int box(WINDOW *, chtype, chtype);
int border(WINDOW *, chtype, chtype, chtype, chtype, chtype, chtype, chtype, chtype);
```

## See Also

- `lib/ncurses/` - Installed library