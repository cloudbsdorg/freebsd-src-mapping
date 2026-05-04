# Component: aac_debug.c

**Path:** `sys/dev/aac/aac_debug.c`
**Type:** File
**Maps to:** `.discovery/sys/dev/aac/aac_debug.md`

## Decomposition

#### Functions
aac_print_queues, aac_printstate0, aac_panic, aac_print_fib, aac_print_aif

#### Global Variables
aac_debug_enable

## Purpose

Debugging support for AAC driver. Conditional compilation (AAC_DEBUG). Provides queue state dumping, FIB (Fiber Interface Block) printing, and AIF (Adapter Information Format) description.

## Dependencies

- `dev/aac/aacreg.h` - AAC register definitions
- `dev/aac/aacvar.h` - AAC structures