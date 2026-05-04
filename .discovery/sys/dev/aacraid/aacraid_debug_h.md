# Component: aacraid_debug.h

**Path:** `sys/dev/aacraid/aacraid_debug.h`
**Type:** Header
**Maps to:** `.discovery/sys/dev/aacraid/aacraid_debug_h.md`

## Decomposition

#### Debug Flags
- HBA_FLAGS_DBG_KERNEL_PRINT_B
- HBA_FLAGS_DBG_FW_PRINT_B
- HBA_FLAGS_DBG_FUNCTION_ENTRY_B
- HBA_FLAGS_DBG_FUNCTION_EXIT_B
- HBA_FLAGS_DBG_ERROR_B
- HBA_FLAGS_DBG_INIT_B
- HBA_FLAGS_DBG_OS_COMMANDS_B
- HBA_FLAGS_DBG_SYNC_COMMANDS_B
- HBA_FLAGS_DBG_AIF_B

#### Functions
aacraid_get_fw_debug_buffer, aacraid_fw_printf, aacraid_fw_print_mem, aacraid_sync_command

## Purpose

Debug flag definitions and function declarations for aacraid driver.