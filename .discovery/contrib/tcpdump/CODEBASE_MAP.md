# contrib/tcpdump/ — Tcpdump Source Codebase Map

**Path:** `contrib/tcpdump/`
**Purpose:** Network packet analyzer

## Overview

tcpdump prints out packet headers for analysis.

## Key Files

| File | Purpose |
|------|---------|
| `tcpdump.c` | Main |
| ` interfaces.c` | Interfaces |
| `savefile.c` | File I/O |
| `print-*.c` | Protocol printers |
| `addrutil.c` | Address utils |
| `nametoaddr.c` | Name lookup |

## Protocol Printers

| File | Protocols |
|------|-----------|
| `print-ip.c` | IP, ICMP, IGMP |
| `print-tcp.c` | TCP |
| `print-udp.c` | UDP |
| `print-ether.c` | Ethernet |
| `print-arp.c` | ARP |
| `print-ip6.c` | IPv6 |
| `print-bgp.c` | BGP |
| `print-dns.c` | DNS |
| `print-udp.c` | UDP |
| `print-frag.c` | Fragments |

## Key Functions

```c
void PrintIP(struct pcap_pkthdr *, u_char *);
void PrintTCP(struct pcap_pkthdr *, u_char *);
void PrintUDP(struct pcap_pkthdr *, u_char *);
void PrintEther(struct pcap_pkthdr *, u_char *);
```

## See Also

- `lib/libpcap/` - Packet capture