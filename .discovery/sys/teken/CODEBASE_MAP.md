# sys/teken/ — Terminal Emulator Codebase Map

**Path:** `sys/teken/`
**Purpose:** Teken terminal emulator (used by vt/console)

## Overview

Teken is a small terminal emulator library used by the virtual terminal (vt) system.

## Key Files

| File | Purpose |
|------|---------|
| `teken.c` | Main terminal emulator |
| `teken.h` | Header |

## Teken Functions

```c
void teken_init(teken_t *t, const teken_funcs_t *funcs);
void teken_input(teken_t *t, const void *buf, size_t n);
void teken_set_winsize(teken_t *t, teken_pos_t rows, teken_pos_t cols);
```

## Callbacks

```c
typedef struct teken_funcs {
    void (*tf_move)(void *, teken_pos_t row, teken_pos_t col);
    void (*tf_fill)(void *, teken_pos_t row, teken_pos_t col, teken_char_t c);
    void (*tf_copy)(void *, teken_rect_t *r, teken_pos_t row, teken_pos_t col);
    void (*tf_respond)(void *, const void *, size_t);
} teken_funcs_t;
```

## See Also

- `sys/dev/vt/` - Virtual terminal