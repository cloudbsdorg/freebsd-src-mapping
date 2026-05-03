# sys/dev/vt/ — Virtual Terminal Codebase Map

**Path:** `sys/dev/vt/`
**Purpose:** Virtual terminal driver

## Overview

The vt driver provides the virtual terminal (console) subsystem.

## Key Files

| File | Purpose |
|------|---------|
| `vt.c` | Core |
| `vt_consolectl.c` | Console control |
| `vt_drawcnt.c` | Drawing |
| `vt_euc.c` | EUC encoding |
| `vt_font.c` | Fonts |
| `vt_histscreen.c` | History |
| `vt_netmap.c` | Netmap |
| `vt_parser.c` | Parser |
| `vt_term.c` | Terminal |
| `vt_txt.c` | Text |
| `vt_window.c` | Windows |

## Key Structures

```c
struct vt_device {
    struct vtent *vd_vt;
    struct winsize vd_ws;
    // ... more
};

struct vt_window {
    int vw_flags;
    struct vt_screen vw_screen;
    // ... more
};
```

## See Also

- `sys/teken/` - Teken terminal emulator