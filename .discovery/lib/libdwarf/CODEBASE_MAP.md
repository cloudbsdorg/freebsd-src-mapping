# lib/libdwarf/ — DWARF Debug Info Library Codebase Map

**Path:** `lib/libdwarf/`
**Purpose:** DWARF debug information access

## Overview

libdwarf provides access to DWARF debug information.

## Key Files

| File | Purpose |
|------|---------|
| `dwarf.h` | Header |
| `dwarf_errmsg.c` | Error messages |
| `dwarf_object_detect.c` | Detection |
| `dwarf_object.c` | Object |
| `dwarf_abbrev.c` | Abbreviations |
| `dwarf_attr.c` | Attributes |
| `dwarf_die.c` | DIE |
| `dwarf_expr.c` | Expressions |
| `dwarf_frame.c` | Frames |
| `dwarf_line.c` | Line |
| `dwarf_loc.c` | Locations |
| `dwarf_macro.c` | Macros |
| `dwarf_pubnames.c` | Pubnames |
| `dwarf_str.c` | Strings |
| `dwarf_types.c` | Types |

## Key Structures

```c
typedef struct Dwarf_Debug_s *Dwarf_Debug;
typedef struct Dwarf_Die_s *Dwarf_Die;
typedef struct Dwarf_Attr_Desc_s *Dwarf_Attribute;
typedef struct Dwarf_Line_s *Dwarf_Line;
typedef struct Dwarf_Frame_s *Dwarf_Frame;
```

## Key Functions

```c
int dwarf_init(int fd, Dwarf_Unsigned access, Dwarf_Unsigned group,
    Dwarf_Error, Dwarf_Debug *);
int dwarf_finish(Dwarf_Debug);
int dwarf_next_cu_header(Dwarf_Debug, Dwarf_Unsigned *, Dwarf_Unsigned *,
    Dwarf_Unsigned *, Dwarf_Unsigned *, Dwarf_Half *, Dwarf_Error *);
int dwarf_siblingof(Dwarf_Debug, Dwarf_Die, Dwarf_Die, Dwarf_Error *);
int dwarf_child(Dwarf_Die, Dwarf_Die *, Dwarf_Error *);
int dwarf_tag(Dwarf_Die, Dwarf_Half *);
```

## See Also

- `sys/kern/kern_linker.c` - Kernel linker