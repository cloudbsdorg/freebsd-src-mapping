# sys/ddb/ — Kernel Debugger (DDB) Codebase Map

**Path:** `sys/ddb/`
**Files:** 22 C source files
**Purpose:** In-kernel debugger for crash analysis and live debugging

## Overview

DDB is the in-kernel debugger. It can be entered via panic, breakpoints, or manual invocation. It allows inspection of kernel state without running userland.

## Core Files

| File | Purpose |
|------|---------|
| `db_main.c` | Main debugger loop |
| `db_command.c` | Command table |
| `db_lex.c` | Lexer/parser |
| `db_expr.c` | Expression evaluation |
| `db_input.c` | Input handling |
| `db_output.c` | Output handling |
| `db_print.c` | Print routines |

### Command Handling

| File | Purpose |
|------|---------|
| `db_command.c` | Command table and dispatch |
| `db_write_cmd.c` | Write commands |
| `db_script.c` | DDB scripts |

### Examination

| File | Purpose |
|------|---------|
| `db_examine.c` | Memory examination (x) |
| `db_pprint.c` | Pretty print |
| `db_access.c` | Memory access |

### Breakpoints/Watchpoints

| File | Purpose |
|------|---------|
| `db_break.c` | Breakpoint handling |
| `db_watch.c` | Watchpoint handling |

### Process/Thread

| File | Purpose |
|------|---------|
| `db_thread.c` | Thread commands |
| `db_ps.c` | Process status |

### Symbol/Symbol Table

| File | Purpose |
|------|---------|
| `db_sym.c` | Symbol lookup |
| `db_ctf.c` | CTF (Compact C Type Format) |

### Other

| File | Purpose |
|------|---------|
| `db_variables.c` | Variable handling |
| `db_run.c` | Execution control |
| `db_textdump.c` | Text dumps |
| `db_capture.c` | Output capture |

## Key Structures

```c
// Debug command
struct db_command {
    const char      *name;           // Command name
    void            (*cmd)(...),     // Handler
    const char      *help;           // Help string
    int             flags;          // Flags
    struct db_command *more;        // Subcommands
};

struct db_variable {
    const char      *name;           // Variable name
    int             (*func)(..., db_expr_t *value); // Get/set
};

// Breakpoint
struct db_breakpoint {
    struct db_breakpoint *next;     // Next
    caddr_t         loc;             // Address
    int             flags;          // Enabled/disabled
    int             access_type;     // Break/watch
};
```

## DDB Commands

```
# Examination
x/a address     - Examine address
x/i address     - Disassemble
x/w address     - Word (4 bytes)
x/h address     - Halfword (2 bytes)
x/b address     - Byte
x/s address     - String

# Breakpoints
break address   - Set breakpoint
delete number   - Delete breakpoint
watch address   - Set watchpoint
cont            - Continue execution

# Process/Thread
ps              - Show processes
thread <tid>    - Switch to thread
show all procs  - Show all processes

# Stack trace
trace           - Stack trace
where           - Stack trace

# Memory
set variable = value
show variable  - Show variable

# Other
run <script>   - Run script
dump <script>  - Capture output
reboot         - Reboot
panic           - Trigger panic
```

## Expression Evaluation

```c
// db_expr.c
db_expr_t db_expression(char **addr);
db_expr_t db_parse_expr(char **addr);
db_expr_t db_evaluate_expr(db_expr_t value);
```

Supports:
- Hex/dec/octal constants
- Symbol names
- Register names ($pc, $sp, etc.)
- Operators (+, -, *, /, &, |, ~)
- Memory dereference (*addr)
- Structure member (struct->member)

## Stack Trace

```c
// db_thread.c
db_show_stack(struct thread *td);
db_trace_thread(struct thread *td, int maxframes);
```

Uses:
- Frame pointer walking
- DWARF debug info
- CTF (Compact C Type Format)

## Key Dependencies

```c
#include <ddb/ddb.h>              // Main header
#include <ddb/db_command.h>       // Command
#include <ddb/db_break.h>         // Breakpoints
#include <sys/stack.h>            // Stack tracing
```

## Entry Points

```c
// Enter debugger
void db_enter(void);

// From panic
void db_panic(void);

// From breakpoint
void db_breakpoint(void);

// From trap
void db_trap(int type, int code);
```

## DDB Scripting

```
# Define script
define foo
    trace
    show thread
end

# Run at breakpoint
stop in foo if condition
```

## Textdump

```c
// db_textdump.c
void db_textdump(caddr_t addr, size_t size);
```

Dumps memory as hex+ASCII text for crash dumps.

## CTF (Compact C Type Format)

```c
// db_ctf.c
int db_ctf_lookup_symbol(const char *name, caddr_t *addr);
int db_ctf_member_offset(const char *type, const char *member);
```

Used for type information in stack traces.

## See Also

- `sys/kdb/` - Kernel debugger framework
- `sys/gdb/` - GDB remote debugging
- `sys/sys/kdb.h` - KDB interface