# lib/libpcap/ — Packet Capture Library Codebase Map

**Path:** `lib/libpcap/`
**Purpose:** Packet capture library

## Overview

libpcap provides a portable framework for low-level network monitoring.

## Key Files

| File | Purpose |
|------|---------|
| `pcap.c` | Main pcap interface |
| `pcap-netmap.c` | NetMap support |
| `pcap-int.h` | Internal header |
| `inet.c` | inet support |

## Functions

```c
pcap_t *pcap_open_live(const char *device, int snaplen, int promisc, int to_ms, char *errbuf);
pcap_t *pcap_open_offline(const char *fname, char *errbuf);
int pcap_dispatch(pcap_t *p, int cnt, pcap_handler callback, u_char *user);
int pcap_loop(pcap_t *p, int cnt, pcap_handler callback, u_char *user);
const u_char *pcap_next(pcap_t *p, struct pcap_pkthdr *h);
int pcap_setfilter(pcap_t *p, struct bpf_program *fp);
```

## Filters

```c
int pcap_compile(pcap_t *p, struct bpf_program *prog, const char *str, int optimize, bpf_u_int32 netmask);
int pcap_setfilter(pcap_t *p, struct bpf_program *prog);
```

## Datalink Types

- DLT_RAW
- DLT_EN10MB (Ethernet)
- DLT_LOOP
- DLT_NULL

## See Also

- `sys/netpcap/` - Kernel pcap
- `usr.bin/tcpdump/` - Uses libpcap