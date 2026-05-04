# Component: aacreg.h

**Path:** `sys/dev/aac/aacreg.h`
**Type:** Header
**Maps to:** `.discovery/sys/dev/aac/aacreg_h.md`

## Decomposition

#### Key Constants
- AAC_MAX_CONTAINERS: 64
- AAC_BLOCK_SIZE: 512
- Queue entry counts (8, 4, 512 entries per queue type)
- Queue indices (PRODUCER_INDEX, CONSUMER_INDEX)

#### Structs
- struct aac_queue_entry - Queue entry (fib_size, fib_addr)
- struct aac_queue_table - Queue table with indices and entries
- FIB header and data structures
- Container/mount object structures
- SRB (SCSI Request Block) structures
- Block read/write request structures
- AIF (Adapter Information Format) structures

## Purpose

Register definitions and data structure layouts for Adaptec FSA adapters. Contains ~1563 lines of closely documented structures matching Adaptec sample code naming conventions.

## Dependencies

- Used by all AAC driver components