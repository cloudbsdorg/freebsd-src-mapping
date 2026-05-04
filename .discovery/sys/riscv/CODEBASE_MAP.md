# FreeBSD: CODEBASE MAP for sys/riscv/

This document maps the RISC-V architecture codebase under FreeBSD's tree to a compact overview:
- directory structure
- key files (machdep.c, trap.c, pmap.c)
- RISC-V specific structures
- SBI (Supervisor Binary Interface) interface

Note: This map reflects the typical organization used in FreeBSD's sys/riscv, and may be adjusted as the tree evolves. It focuses on the high-level layout and the usual integration points between kernel VM, trap handling, and SBI-based tooling.

## Directory structure (typical layout)
- sys/riscv/
  - machdep.c                 : Machine-dependent initialization and low-level setup for RISC-V.
  - trap.c                    : Trap/exception entry and exit handling for RISCV.
  - pmap.c                    : Physical map implementation for RISCV (VM/pmap integration).
  - sbi.c                     : SBI wrapper/implementation for interacting with SBI services.
  - include/
    - riscv.h                  : RISCV-specific core definitions and types.
    - sbi.h                    : SBI interface declarations and IDs.
  - arch/
    - riscv/
      - (architecture-specific helpers and per-CPU state definitions)
  - platform/
    - (board/SoC-specific support files, if present)

> The exact subdirectory names beyond the core files may vary by FreeBSD's tree layout across versions. The three key files are placed in sys/riscv/ alongside their related headers, with SBI glue typically co-located or closely linked to the arch layer.

## Key files
- machdep.c
  - Role: Initialize RISCV hardware, set up page tables during boot, handle early CPU setup.
- trap.c
  - Role: Handle traps/interrupts, context switch entry/exit paths, and trap-based fault handling.
- pmap.c
  - Role: Implement the FreeBSD pmap interface for RISCV, including page table management and VM map operations.

## RISC-V specific structures (examples you typically see in the RISCV tree)
- Per-CPU state structures (e.g., riscv_cpu) to track CPU-local data such as TLB state, hart ID, and per-CPU trap frames.
- Trap frame layout for saving/restoring registers on trap/interrupt entry.
- Pmap-related structures (e.g., riscv_pmap) that extend the generic pmap with RISCV-specific fields like ASID/hart mapping, TLB state, and page table root pointers.
- Address space and VM resources tailored to RISCV (page tables, PTEs, page size information, and ASID management).

Notes:
- The exact structure names and members depend on the FreeBSD version and tree snapshot you are viewing. The RISCV architecture typically uses per-CPU Hart IDs, ASID-based TLB tagging, and a trapframe that preserves general-purpose registers for return to user mode.

## SBI interface (Supervisor Binary Interface)
- Purpose: Bridge between the OS kernel and the hardware/silicon-provided firmware for services like timer, console I/O, and power management.
- Common components you’ll find in the RISCV SBI integration:
  - sbi.c (and/or sbi_bridge.c): Wrapper functions around SBI calls (e.g., sbi_call, sbi_ecall) used by the kernel to issue SBI requests.
  - include/sbi.h: Declarations of SBI function IDs and the interface, including IDs such as SBI_SET_TIMER, SBI_CONSOLE_PUTCHAR, SBI_CONSOLE_GETCHAR, SBI_SHUTDOWN, and platform/hart specific extensions.
  - Architecture glue: Small RISCV-specific helpers to translate OS-level concepts (like timer events) into SBI calls.
  - Boot/early-boot path may rely on SBI to print bootstrap messages or to arm timers before full MMU/VM initialization.

Key SBI patterns you’ll commonly map:
- SBI function IDs and argument registers used by sbi_call wrappers.
- Console I/O via SBI (putchar/getchar) during early boot or in early console scenarios.
- Timer setup via SBI_SET_TIMER for scheduling and timeouts.
- HART (CPU) management via SBI calls in SMP setups, if supported by the platform.

## How this map is used
- It helps quickly locate and understand where RISCV-specific kernel responsibilities live, how VM and trap handling are wired together, and where SBI interactions occur.
- It serves as a reference during code reviews, audits, or onboarding to the RISCV portion of FreeBSD.

## Validation notes
- Verify that machdep.c, trap.c, and pmap.c exist under sys/riscv/ in your checked-out tree.
- Ensure include/sbi.h exists and defines the expected SBI IDs used by sbi.c wrappers.
- Lint/typecheck and the kernel build should succeed when these files are active in the build.
