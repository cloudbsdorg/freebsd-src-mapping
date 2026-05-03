# sys/netinet6/ — IPv6 Stack Codebase Map

**Path:** `sys/netinet6/`
**Files:** 33 C source files
**Purpose:** IPv6 protocol implementation

## Overview

The netinet6 directory implements the TCP/IPv6 stack. It mirrors the IPv4 stack in sys/netinet/ but for IPv6, including IP, ICMPv6, NDP, and transport protocols.

## Core IP Layer

| File | Purpose | Key Functions |
|------|---------|---------------|
| `ip6_input.c` | IPv6 input | `ip6_input()`, `ip6_process()` |
| `ip6_output.c` | IPv6 output | `ip6_output()`, `ip6_output_fragment()` |
| `ip6_forward.c` | IPv6 forwarding | `ip6_forward()` |
| `ip6_fastfwd.c` | Fast forwarding | `ip6_fastforward()` |
| `ip6_id.c` | Fragment ID | IPv6 identification |
| `ip6_gre.c` | GRE over IPv6 | `ip6_gre_output()` |
| `frag6.c` | Fragmentation | `frag6_input()` |

## Protocol Control

| File | Purpose |
|------|---------|
| `in6_proto.c` | Protocol switch |
| `in6_pcb.c` | PCB operations |
| `in6.c` | Address manipulation |
| `in6_cksum.c` | Checksum routines |

## Neighbor Discovery (NDP)

| File | Purpose | Key Functions |
|------|---------|---------------|
| `nd6.c` | Core ND | `nd6_resolve()`, `nd6_lookup()` |
| `nd6_nbr.c` | Neighbor | `nd6_nbr_cache()` |
| `nd6_rtr.c` | Router | `nd6_rtr_request()`, `nd6_rtr solicitation()` |

### NDP Messages

- **Router Solicitation** (RS) - Host requests routers
- **Router Advertisement** (RA) - Router announces presence
- **Neighbor Solicitation** (NS) - Address resolution
- **Neighbor Advertisement** (NA) - Response to NS
- **Redirect** - Router redirects traffic

## Multicast (MLD)

| File | Purpose | Key Functions |
|------|---------|---------------|
| `mld6.c` | MLDv2 | `mld_input()`, `mld_fast_done()` |
| `in6_mcast.c` | Multicast | `in6_mcast_leavegroup()` |

## Address Management

| File | Purpose |
|------|---------|
| `in6_ifattach.c` | Interface address attachment |
| `scope6.c` | Scope ID handling |
| `in6_src.c` | Source address selection |

## Routing

| File | Purpose |
|------|---------|
| `route6.c` | IPv6 routing |
| `in6_fib.c` | Forwarding table |
| `in6_fib_algo.c` | FIB algorithms |
| `in6_rmx.c` | Routing metrics |
| `in6_rss.c` | RSS for IPv6 |

## Address Selection

```c
// in6.c
struct in6_addr {
    u_int8_t    s6_addr[16];    // 128-bit address
};
```

### IPv6 Address Types

- **Unicast** - Single interface
  - Link-local (fe80::/10)
  - Unique local (fc00::/7)
  - Global (2000::/3)
- **Multicast** (ff00::/8)
- **Anycast** - Multiple interfaces, closest selected

## ICMPv6

| File | Purpose |
|------|---------|
| `icmp6.c` | ICMPv6 handling |

### ICMPv6 Types

- **Error** (type 1-4): Destination unreachable, Packet too big, Time exceeded, Parameter problem
- **Info** (type 128-137): Echo request/reply, Group query/report/leave
- **NDP** (type 133-137): Router solicitation, advertisement, neighbor solicitation/advertisement, redirect

## Transport Protocols

| File | Purpose |
|------|---------|
| `udp6_usrreq.c` | UDPv6 |
| `raw_ip6.c` | Raw IPv6 |
| `sctp6_usrreq.c` | SCTP over IPv6 |
| `send.c` | Multicast routing send |

## IPv6 Header

```c
struct ip6_hdr {
    union {
        struct ip6_hdrctl {
            u_int32_t ip6_un1_flow;   // Flow label + version
            u_int16_t ip6_un1_plen;   // Payload length
            u_int8_t  ip6_un1_nxt;    // Next header
            u_int8_t  ip6_un1_hlim;   // Hop limit
        } ip6_un1;
        u_int8_t ip6_vfc;            // Version + class
    } ip6_pkt;
    struct in6_addr ip6_src;          // Source
    struct in6_addr ip6_dst;          // Destination
};
```

## Extension Headers

IPv6 uses chained extension headers:

```c
// Hop-by-hop options (0)
// Destination options (60)
// Routing (43)
// Fragment (44)
// Authentication (51) - AH
// ESP (50) - already in netipsec
// Mobility (135)
// Host identity (139)
// No next header (59)
```

## IPv6 Fragment Header

```c
struct ip6_frag {
    u_int8_t  ip6f_nxt;       // Next header
    u_int8_t  ip6f_reserved;  // Reserved
    u_int16_t ip6f_offlg;     // Offset + flags
    u_int32_t ip6f_ident;     // Identification
};
```

## Router Advertisement

```c
struct nd_router_advert {
    u_int32_t nd_ra_type;          // ND_ROUTER_ADVERT
    u_int32_t nd_ra_code;          // 0
    u_int16_t nd_ra_cksum;        // Checksum
    u_int16_t nd_ra_curhoplimit;   // Current hop limit
    u_int8_t  nd_ra_flags_reserved; // Flags (M, O)
    u_int16_t nd_ra_router_lifetime; // Router lifetime
    u_int32_t nd_ra_reachable_time;  // Reachable time
    u_int32_t nd_ra_retransmit_time; // Retransmit time
};
```

## Key Dependencies

```c
#include <netinet/in.h>         // General inet
#include <netinet/ip6.h>        // IPv6 header
#include <netinet/icmp6.h>      // ICMPv6
#include <netinet/nd6.h>        // NDP
#include <netinet6/in6_pcb.h>   // PCB
#include <netinet6/scope6_var.h> // Scopes
```

## Relationship to IPv4

```
sys/netinet/ (IPv4)
    │
    ├── ip_input.c → ip6_input.c
    ├── ip_output.c → ip6_output.c
    ├── in_pcb.c → in6_pcb.c
    ├── ip_icmp.c → icmp6.c
    └── TCP/UDP (shared)
```

## sysctl Variables

```
net.inet6.ip6.forwarding
net.inet6.ip6.hlim
net.inet6.ip6.maxfragpackets
net.inet6.icmp6.redirecttimeout
net.inet6.nd6.prune
net.inet6.nd6.umaxtgt
net.inet6.mld.doingv1
```

## See Also

- `sys/netinet/ip_input.c` - IPv4 (shares TCP/UDP)
- `sys/netipsec/` - IPsec for IPv6
- `sys/netinet6/ipsec6.c` - IPv6 IPsec
- `sys/netinet6/sctp6_usrreq.c` - SCTP