# sys/netinet/ — IPv4 Stack Codebase Map

**Path:** `sys/netinet/`
**Files:** 76 C source files
**Purpose:** IPv4 protocol implementation

## Overview

The netinet directory implements the TCP/IPv4 stack. It includes IP, ICMP, IGMP, TCP, UDP, and SCTP protocols, plus address family infrastructure.

## Protocol Layer Architecture

```
┌─────────────────────────────────────┐
│         Application Layer              │
└─────────────────────────────────────┘
              │socket()
              ▼
┌─────────────────────────────────────┐
│    uipc_socket.c (BSD Sockets)        │
└─────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│         Protocol Switch                │
│    (in_pcb.c protocol switch)         │
└─────────────────────────────────────┘
         │              │
    ┌────┴───┐    ┌────┴───┐
    │  TCP   │    │  UDP   │
    │        │    │        │
    └────────┘    └────────┘
         │              │
    ┌────┴─────┐    ┌─┴───────┐
    │tcp_subr.c│    │udp_usrreq│
    │tcp_input │    │          │
    └────┬─────┘    └──────────┘
         │
         ▼
┌─────────────────────────────────────┐
│              IP Layer                  │
│    ip_input.c, ip_output.c           │
└─────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────┐
│           Network Interfaces           │
│         (net/if.[c|h])              │
└─────────────────────────────────────┘
```

## IP Layer (Core)

| File | Purpose | Key Functions |
|------|---------|-------------|
| `ip_input.c` | IP input processing | `ip_input()`, `ip_forward()` |
| `ip_output.c` | IP output | `ip_output()`, `ip_fragment()` |
| `ip_reass.c` | IP fragmentation | `ip_reass()` |
| `ip_id.c` | IP ID generation | IP ID assignment |
| `ip_options.c` | IP options | `ip_optcopy()`, `ip_insertoptions()` |
| `ip_encap.c` | IP encapsulation | tunnel encaps |
| `ip_gre.c` | GRE tunneling | GRE protocol |
| `ip_ecn.c` | ECN support | Explicit Congestion Notification |
| `ip_carp.c` | CARP failover | Common Address Redundancy |
| `ip_divert.c` | Divert sockets | IP divert |
| `ip_mroute.c` | Multicast routing | Mroute, IGMP |
| `ip_fastfwd.c` | Fast forwarding | `ip_fastforward()` |

**IP Header:**
```c
struct ip {
    u_int8_t    ip_hl:4,     // Header length
                    ip_v:4;      // Version
    u_int8_t    ip_tos;       // Type of service
    u_int16_t    ip_len;       // Total length
    u_int16_t    ip_id;        // Identification
    u_int16_t    ip_off;       // Fragment offset
    u_int8_t    ip_ttl;       // Time to live
    u_int8_t    ip_p;         // Protocol
    u_int16_t    ip_sum;       // Checksum
    struct in_addr ip_src, ip_dst;  // Source/dest
};
```

## TCP Protocol

| File | Purpose | Key Functions |
|------|---------|-------------|
| `tcp_subr.c` | TCP core | `tcp_input()`, `tcp_output()` |
| `tcp_input.c` | TCP input | Main input processing |
| `tcp_output.c` | TCP output | Segment generation |
| `tcp_timer.c` | TCP timers | `tcp_timer_*()` |
| `tcp_syncache.c` | SYN cache | Half-open connection cache |
| `tcp_reass.c` | Segment reassembly | `tcp_reass()` |
| `tcp_sack.c` | SACK support | Selective ACK |
| `tcp_usrreq.c` | User requests | `tcp_usrreq()` |
| `tcp_offload.c` | TOE | TCP offload engine |
| `tcp_lro.c` | LRO | Large receive offload |
| `tcp_hpts.c` | TCP hpts | TCP host PTS |
| `tcp_timewait.c` | Time wait | Time wait state |
| `tcp_hostcache.c` | Host cache | Connection cache |
| `tcp_fastopen.c` | Fast Open | TFO |
| `tcp_ecn.c` | ECN | Explicit CN |
| `tcp_ratelimit.c` | Rate limiting | TCB rate limit |

**TCP State Machine:**
```
CLOSED → SYN_SENT → ESTABLISHED → FIN_WAIT_1 → FIN_WAIT_2
   ↑                                    ↓
   └──────←←←←←←←←←←←←←←←←←←←←←←←←←←←←←←←←
        LISTEN → SYN_RECEIVED → ESTABLISHED → CLOSING → TIME_WAIT → CLOSED
```

**TCP Header:**
```c
struct tcphdr {
    u_int16_t th_sport;       // Source port
    u_int16_t th_dport;       // Dest port
    tcp_seq th_seq;           // Sequence number
    tcp_seq th_ack;           // Ack number
    u_int8_t th_off:4,       // Data offset
            th_x2:4;           // Reserved
    u_int8_t th_flags;        // Flags (FIN, SYN, RST, etc)
    u_int16_t th_win;         // Window
    u_int16_t th_sum;        // Checksum
    u_int16_t th_urp;        // Urgent pointer
};
```

## UDP Protocol

| File | Purpose | Key Functions |
|------|---------|-------------|
| `udp_usrreq.c` | User requests | `udp_usrreq()` |
| `udp_var.h` | UDP variables | UDP control blocks |

**UDP Header:**
```c
struct udphdr {
    u_int16_t uh_sport;       // Source port
    u_int16_t uh_dport;       // Dest port
    u_int16_t uh_ublen;       // Length
    u_int16_t uh_sum;        // Checksum
};
```

## ICMP Protocol

| File | Purpose | Key Functions |
|------|---------|-------------|
| `ip_icmp.c` | ICMP handling | `icmp_input()`, `icmp_error()`, `icmp_reflect()` |

**ICMP Types:**
- Echo request/reply (ping)
- Destination unreachable
- Time exceeded
- Parameter problem
- Redirect

## IGMP Protocol

| File | Purpose | Key Functions |
|------|---------|-------------|
| `igmp.c` | IGMP handling | `igmp_input()`, `igmp_joingroup()` |

## SCTP Protocol

| File | Purpose |
|------|---------|
| `sctp_input.c` | SCTP input |
| `sctp_output.c` | SCTP output |
| `sctp_usrreq.c` | User requests |
| `sctp_pcb.c` | Protocol control block |
| `sctp_syscalls.c` | System calls |
| `sctp_timer.c` | Timers |
| `sctp_indata.c` | Data handling |
| `sctp_auth.c` | Authentication |
| `sctp_output.c` | Output |
| `sctp_peeloff.c` | Association peeloff |

## Protocol Control Block (in_pcb)

| File | Purpose |
|------|---------|
| `in_pcb.c` | PCB management |
| `in_proto.c` | Protocol switch |

**PCB Structure:**
```c
struct inpcb {
    struct inpcbinfo *inp_pcbinfo;
    struct inpcbport *inp_le;       // Hash links
    struct socket *inp_socket;       // Back pointer
    struct in_addr inp_laddr;        // Local address
    struct in_addr inp_faddr;        // Foreign address
    u_int16_t inp_lport;             // Local port
    u_int16_t inp_fport;             // Foreign port
    // ... more fields
};
```

## Address Family Infrastructure

| File | Purpose |
|------|---------|
| `in.c` | Address manipulation |
| `in_pcb.c` | PCB operations |
| `in_proto.c` | `struct protosw` for inet |
| `in_cksum.c` | Checksum routines |
| `in_fib.c` | Forwarding table |
| `in_mcast.c` | Multicast |
| `in_rmx.c` | Routing metrics |
| `in_jail.c` | Jail support |

## Accept Filters (accf_*)

| File | Purpose |
|------|---------|
| `accf_http.c` | HTTP accept filter |
| `accf_data.c` | Data accept filter |
| `accf_dns.c` | DNS accept filter |
| `accf_tls.c` | TLS accept filter |

## Ethertype Support

| File | Purpose |
|------|---------|
| `if_ether.c` | ARP, Ethernet |

## Checksum Offload

| File | Purpose |
|------|---------|
| `in_cksum.c` | `in_cksum()`, `in4_cksum()` |

## DTrace Support

| File | Purpose |
|------|---------|
| `in_kdtrace.c` | DTrace hooks |
| `tcp_log_buf.c` | TCP log buffer |

## Key Include Dependencies

```c
// Core IP
#include <netinet/ip.h>
#include <netinet/ip_var.h>
#include <netinet/tcp.h>
#include <netinet/tcp_fsm.h>
#include <netinet/tcp_var.h>
#include <netinet/udp.h>
#include <netinet/udp_var.h>
#include <netinet/in_pcb.h>
#include <netinet/in_proto.h>

// From net/ subdirectory
#include <net/if.h>
#include <net/if_var.h>
#include <net/route.h>
```

## Routing

```
ip_input.c
    │
    ├── ip_fastfwd.c (fast path)
    │
    └── ip_forward()
            │
            └── rtalloc() → routing table lookup
```

## Network Buffer Flow

```
NIC interrupt
    │
    ▼
net/if.c:if_input()
    │
    ▼
ether_input() (if Ethernet)
    │
    ▼
IP input (ip_input.c)
    │
    ├── TCP (tcp_input.c)
    ├── UDP (udp_usrreq.c)
    ├── ICMP (ip_icmp.c)
    └── etc.
```

## Socket Options

```c
// IP level
IP_OPTIONS
IP_TOS
IP_TTL
IP_RECVDSTADDR
IP_RECVIF
IP_MTU
IP_MTU_DISCOVER

// TCP level
TCP_NODELAY
TCP_NOOPT
TCP_KEEPIDLE
TCP_KEEPINTVL
TCP_KEEPCNT
TCP_MAXSEG
TCP_MD5SIG

// UDP level
UDP_NOLISTENER
```

## sysctl Variables

```
net.inet.ip.forwarding
net.inet.ip.ttl
net.inet.ip.portfirst
net.inet.tcp.mssdflt
net.inet.tcp.syncookies
net.inet.tcp.timestamps
net.inet.tcp.sack
net.inet.tcp.rfc1323
net.inet.udp.checksum
```

## Performance Features

| Feature | File |
|---------|------|
| LRO (Large Receive Offload) | tcp_lro.c |
| TOE (TCP Offload Engine) | tcp_offload.c |
| TSO (TCP Segmentation Offload) | (network drivers) |
| RSS (Receive Side Scaling) | in_rss.c |
| H-TSO | tcp_hpts.c |
| TFO (TCP Fast Open) | tcp_fastopen.c |
| RBUF (Rexmit Buffer) | tcp_log_buf.c |

## See Also

- `sys/net/if.c` - Network interface
- `sys/net/if_ethersubr.c` - Ethernet
- `sys/netinet6/` - IPv6
- `sys/netipsec/` - IPsec