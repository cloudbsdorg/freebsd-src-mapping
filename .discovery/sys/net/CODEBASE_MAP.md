# sys/net/ — Network Interface Core Codebase Map

**Path:** `sys/net/`
**Files:** 51 C source files
**Purpose:** Network interface infrastructure, routing, BPF, packet filtering

## Overview

The net/ directory provides core networking infrastructure that is protocol-independent. It handles network interfaces, routing tables, packet filtering hooks, and raw packet access via BPF.

## Core Interface Files

| File | Purpose | Key Structures |
|------|---------|---------------|
| `if.c` | Interface management | `ifnet`, `ifaddr`, `if_data` |
| `if_clone.c` | Dynamic interface cloning | `if_clone*` |
| `if_mib.c` | SNMP MIB-II | `ifMIB` |
| `if_media.c` | Media selection | `ifmedia*` |

### Key Interface Structure

```c
struct ifnet {
    char    if_xname[IFNAMSIZ];  // Interface name
    struct  ifaddr *if_addrhead;   // Address list
    struct  ifmultiaddr *if_multiaddrs; // Multicast
    struct  ifqueue {
        struct mbuf *ifq_head;
        struct mbuf *ifq_tail;
        int ifq_len;
        int ifq_maxlen;
        struct  selinfo ifq_waiting;
    } if_snd;                      // Send queue
    void    (*if_start)(struct ifnet *);
    int     (*if_ioctl)(struct ifnet *, u_long, caddr_t);
    void    (*if_init)(struct ifnet *);
    int     if_flags;              // IFF_UP, IFF_BROADCAST, etc.
    int     if_capabilities;       // Hardware capabilities
    int     if_capenable;          // Enabled capabilities
    struct  ifaddr *if_addr;       // Primary address
    // ... more fields
};

struct ifaddr {
    struct  sockaddr *ifa_addr;    // Address
    struct  sockaddr *ifa_netmask; // Netmask
    struct  sockaddr *ifa_dstaddr; // Point-to-point dest
    struct  ifnet *ifa_ifp;        // Back pointer
    void    (*ifa_rtrequest)(int, struct rtentry *, struct sockaddr *);
};
```

## Virtual Interface Types

| File | Type | Purpose |
|------|------|---------|
| `if_loop.c` | Loopback | `lo0` - localhost traffic |
| `if_ethersubr.c` | Ethernet | MAC-level processing |
| `if_vlan.c` | VLAN | 802.1Q virtual LAN |
| `if_bond.c` | (in if_lagg) | Link aggregation |
| `if_bridge.c` | Bridge | Ethernet bridging |
| `if_gre.c` | GRE | Generic routing encapsulation |
| `if_gif.c` | GIF | Generic tunnel interface |
| `if_stf.c` | STf | 6to4 tunnel |
| `if_epair.c` | Epair | Virtual Ethernet pair |
| `if_disc.c` | Discard | `/dev/null` network |
| `if_dead.c` | Dead | Disabled interface |
| `if_me.c` | ME | "My Ethernet" (inter-machine) |
| `if_tuntap.c` | TUN/TAP | Virtual network device |
| `if_vxlan.c` | VXLAN | Virtual extensible LAN |
| `if_geneve.c` | GENEVE | Generic network virtualization |
| `if_ovpn.c` | OpenVPN | OpenVPN tunnel |
| `if_infiniband.c` | IPoIB | IP over InfiniBand |

### Loopback Interface

```c
// if_loop.c
static int loopattach(int unit);
static void loopstart(struct ifnet *ifp);
static int loopoutput(struct ifnet *ifp, struct mbuf *m,
    struct sockaddr *dst, struct rtentry *rt);
static void loopintr(void);
```

### Ethernet Interface

```c
// if_ethersubr.c
void ether_input(struct ifnet *ifp, struct mbuf *m);
void ether_output(struct ifnet *ifp, struct mbuf *m,
    struct sockaddr *dst, struct rtentry *rt);
static void ether_demux(struct ifnet *ifp, struct mbuf *m,
    struct ether_header *eh);
void ether_ifattach(struct ifnet *ifp);
void ether_ifdetach(struct ifnet *ifp);
```

### VLAN Interface

```c
// if_vlan.c
struct vlan_mc_entry;           // Multicast list
struct vlan_inet6_mc_entry;    // IPv6 multicast

struct ifvlan {
    struct  ifnet *ifv_p;        // Parent interface
    u_int  ifv_tag;             // VLAN tag
    u_int  ifv_proto;            // Protocol (ETHERTYPE_VLAN)
};
```

## BPF (Berkeley Packet Filter)

| File | Purpose |
|------|---------|
| `bpf.c` | BPF core |
| `bpf_filter.c` | Filter VM |
| `bpf_buffer.c` | Buffer management |
| `bpf_ifnet.c` | Interface attachment |
| `bpf_jitter.c` | JIT compiler |
| `bpf_zerocopy.c` | Zero-copy support |

### BPF Structure

```c
struct bpf_if {
    struct bpf_if *bif_next;      // Next interface
    struct ifnet *bif_ifp;         // Attached interface
    struct bpf_d *bif_dlist;       // Descriptor list
    u_int bif_dlt;                  // Data link type
};

struct bpf_d {
    struct bpf_d *bd_next;         // Next descriptor
    struct bpf_insn *bd_insns;      // Filter program
    int bd_len;                     // Program length
    caddr_t bd_hbuf;               // Heap buffer
    struct mbuf *bd_sbuf;          // Small buffer
    struct ifnet *bd_bif;          // Interface
};
```

## Packet Filtering (pfil)

| File | Purpose |
|------|---------|
| `pfil.c` | Packet filter hooks |

```c
// pfil.h
struct pfil_hook {
    TAILQ_ENTRY(pfil_hook) ph_link;
    int ph_flags;
    int (*ph_func)(struct mbuf **, struct ifnet *, int);
    void *ph_rule;
};

// pfil.c
int pfil_add_hook(int (*func)(struct mbuf **, struct ifnet *, int),
    int flags, int family);
int pfil_remove_hook(int (*func)(struct mbuf **, struct ifnet *, int),
    int flags, int family);
```

## Routing

| File | Purpose | Key Structures |
|------|---------|---------------|
| `route.c` | Routing tables | `rtentry`, `radix_node` |
| `radix.c` | Radix tree | `radix_node_head` |
| `rtsock.c` | Routing sockets |rtioctl, rtmsghdr |

### Routing Structures

```c
struct rtentry {
    struct  radix_node rt_nodes[2];  // Radix tree nodes
    struct  sockaddr *rt_gateway;     // Gateway address
    struct  ifnet *rt_ifp;           // Interface
    struct  ifaddr *rt_ifa;          // Interface address
    struct  sockaddr *rt_genmask;     // Generation mask (clone)
    void    (*rt_llinfo)(struct rtentry *, struct sockaddr *,
                     int);
    void    (*rt_output)(struct ifnet *, struct mbuf *,
                     struct sockaddr *, struct rtentry *);
    u_long  rt_flags;                // RTF_UP, RTF_GATEWAY, etc.
    int     rt_metric;                // Metric
    struct  mbuf *rt_rtlabel;         // Route label
};
```

## Network Interface Queues

| File | Purpose |
|------|---------|
| `ifq.c` | Interface send queue |
| `netisr.c` | Network ISR dispatch |

### ifqueue Structure

```c
struct ifqueue {
    struct  mbuf *ifq_head;
    struct  mbuf *ifq_tail;
    int     ifq_len;
    int     ifq_maxlen;
    int     ifq_drops;
    struct  selinfo ifq_waiting;
    struct  mtx ifq_mtx;
};
```

### netisr

```c
// netisr.c
struct netisr_handler {
    u_int   nh_proto;         // Protocol
    void    (*nh_handler)(struct mbuf *);
    int     nh_policy;        // Dispatch policy
};

void netisr_dispatch(int proto, struct mbuf *m);
void netisr_register(int proto, void (*handler)(struct mbuf *),
    int policy);
```

## Link Aggregation

| File | Purpose |
|------|---------|
| `if_lagg.c` | LACP, failover |
| `ieee8023ad_lacp.c` | LACP state machine |

### LACP Structure

```c
struct lacp_softc {
    struct  ifnet *lsc_ifp;           // Aggregator interface
    TAILQ_HEAD(, lacp_port) lsc_ports; // Member ports
    u_int   lsc_min_links;            // Min active links
};
```

## Bridging

| File | Purpose |
|------|---------|
| `if_bridge.c` | Bridge functionality |
| `bridgestp.c` | Spanning Tree (STP) |

### Bridge Structure

```c
struct bridge_softc {
    struct  ifnet *sc_if;             // Bridge interface
    TAILQ_HEAD(, bridge_iflist) sc_iflist; // Member interfaces
    struct  bridge_stp_state *sc_stp; // STP state
    struct  hashtbl *sc_hashtbl;      // MAC address table
};
```

## Multi-Path Processing

| File | Purpose |
|------|---------|
| `mp_ring.c` | Multi-processor ring |
| `mppcc.c` | Packet compression |
| `mppcd.c` | Packet decompression |

## RSS (Receive Side Scaling)

| File | Purpose |
|------|---------|
| `rss_config.c` | RSS configuration |
| `toeplitz.c` | Toeplitz hash |

## Compression

| File | Purpose |
|------|---------|
| `slcompress.c` | Van Jacobson compression (TCP/IP header) |

## BPF Instruction Set

```c
// bpf_insn structure
struct bpf_insn {
    u_short code;     // Opcode
    u_char  jt;       // Jump true
    u_char  jf;       // Jump false
    u_int   k;        // Generic field
};
```

## Packet Flow

```
 NIC Interrupt
      │
      ▼
 if_input() (net/if.c)
      │
      ├── BPF tap (bpf.c)
      │
      ▼
 ether_input() (if_ethersubr.c)
      │
      ▼
 ip_input() (netinet/ip_input.c)
      │
      └── TCP/UDP/ICMP
```

## Output Flow

```
 TCP/UDP Output
      │
      ▼
 ip_output() (netinet/ip_output.c)
      │
      ▼
 if_output() (net/if.c)
      │
      ▼
 ether_output()
      │
      ▼
 if_handoff() → NIC driver
```

## VNET (Virtual Network Stack)

```c
// vnet.c
struct vnet {
    struct  ifnet *vnet_if;          // Interface list
    struct  radix_node_head *vnet_rnh; // Routing table
    struct  ifnet *vnet_loopitf;     // Loopback
    // ... per-vnet state
};
```

## Key Dependencies

```c
#include <net/if.h>          // Core interface
#include <net/if_var.h>      // Interface variables
#include <net/if_arp.h>      // ARP
#include <net/ethernet.h>    // Ethernet
#include <net/route.h>       // Routing
#include <net/bpf.h>         // BPF
#include <net/pfil.h>        // Packet filter
#include <netinet/in.h>      // INET
#include <netinet/ip.h>      // IP
#include <netinet/if_ether.h> // Ethernet
```

## sysctl Variables

```
net.ifdescs_max
net.ifq.maxlen
net.ifq.drops
net.isr.enable
net.isr.maxloop
net.bpf.maxinsns
net.bpf.optimize_writers
```

## See Also

- `sys/netinet/` - IPv4 stack
- `sys/netinet6/` - IPv6
- `sys/netipsec/` - IPsec
- `sys/netgraph/` - Netgraph