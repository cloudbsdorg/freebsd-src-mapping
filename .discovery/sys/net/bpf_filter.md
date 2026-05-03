# Component: bpf_filter.c

**Path:** `sys/net/bpf_filter.c`
**Type:** File
**Maps to:** `.discovery/sys/net/bpf_filter.md`

## Purpose

BPF filter - Berkeley Packet Filter filter engine.

## Key Functions

| Function | Purpose | Signature |
|----------|---------|-----------|
| `bpf_filter` | Filter | `u_int bpf_filter(struct bpf_insn *pc, struct mbuf *m, ...)` |
| `EXTRACT_SHORT` | Extract short | `u_int16_t EXTRACT_SHORT(u_char *p)` |
| `EXTRACT_LONG` | Extract long | `u_int32_t EXTRACT_LONG(u_char *p)` |

## BPF Instructions

| Item | Description |
|------|-------------|
| `BPF_LD` | Load |
| `BPF_JMP` | Jump |
| `BPF_RET` | Return |

## Use Cases

| Use | Description |
|-----|-------------|
| `bpf` | Berkeley Packet Filter |
| `filter` | Packet filtering |

## Includes

- `net/bpf.h` - BPF definitions