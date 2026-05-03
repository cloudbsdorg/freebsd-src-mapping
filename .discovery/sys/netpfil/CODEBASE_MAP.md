# sys/netpfil/ — Packet Filter Framework Codebase Map

**Path:** `sys/netpfil/`
**Files:** 42 C source files
**Purpose:** Packet filtering, NAT, and traffic shaping

## Overview

netpfil contains two major firewall systems: PF (Packet Filter) and IPFW (IP Firewall), plus the dummynet traffic shaper.

## PF (Packet Filter)

Located in `pf/`

### Core Files

| File | Purpose |
|------|---------|
| `pf.c` | Main PF engine |
| `pf_if.c` | Interface handling |
| `pf_ioctl.c` | IOCTL interface |
| `pf_norm.c` | Packet normalization |
| `pf_ruleset.c` | Rule management |
| `pf_table.c` | Address tables |
| `pf_lb.c` | Load balancing |
| `pf_nl.c` | Netlink interface |
| `pf_nv.c` | Name-value interface |

### Additional PF Modules

| File | Purpose |
|------|---------|
| `pf_syncookies.c` | SYN cookies |
| `pf_osfp.c` | OS fingerprinting |
| `pflow.c` | NetFlow export |
| `pfsync_nv.c` | PFSYNC sync |
| `if_pfsync.c` | PFSYNC interface |
| `if_pflog.c` | PF logging interface |
| `inet_nat64.c` | NAT64 |

### PF Rules

```c
// PF rule structure
struct pf_rule {
    struct pf_rule_addr src;
    struct pf_rule_addr dst;
    char         ifname[IFNAMSIZ];
    char         natifname[IFNAMSIZ];
    u_int16_t   rule_flag;
    u_int8_t    action;              // PF_PASS, PF_DROP, PF_SCRUB
    u_int8_t    direction;            // IN, OUT, INOUT
    u_int8_t    proto;               // Protocol
    struct pf_addr_mask *src_mask;
    struct pf_addr_mask *dst_mask;
    int         rpool_id;           // Pool ID
    // ... many more
};
```

### PF States

```c
// State entry
struct pf_state {
    struct pf_state_key *key;        // Connection key
    struct pf_state_key *key_sync;   // Sync key
    u_int8_t    direction;           // IN, OUT
    u_int32_t   expires;            // Expire time
    u_int32_t   timeout;            // Timeout
    u_int16_t   state;              // State (TCPS_*)
    u_int8_t    log;                // Logging
    // ... more
};
```

### PF Actions

```c
#define PF_PASS         0           // Pass packet
#define PF_DROP         1           // Drop packet
#define PF_SCRUB        2           // Normalize packet
#define PF_NAT          3           // NAT
#define PF_NATOUT       4           // NAT outbound
#define PF_BINAT        5           // Bidirectional NAT
#define PF_RDR          6           // Redirect
#define PF_RDRIN        7           // Redirect inbound
#define PF_SYNPROXY     8           // SYN proxy
#define PF_DUMMYNET     9           // Dummynet
```

## IPFW (IP Firewall)

Located in `ipfw/`

### Core Files

| File | Purpose |
|------|---------|
| `ip_fw2.c` | Basic IPFW |
| `ip_fw_sockopt.c` | Socket options |
| `ip_fw_table.c` | Hash tables |
| `ip_fw_table_algo.c` | Table algorithms |
| `ip_fw_table_value.c` | Table values |
| `ip_fw_nat.c` | NAT |
| `ip_fw_log.c` | Logging |
| `ip_fw_iface.c` | Interface |
| `ip_fw_dynamic.c` | Dynamic rules |
| `ip_fw_eaction.c` | Extended actions |
| `ip_fw_pfil.c` | Pfil hooks |
| `ip_fw_bpf.c` | BPF |
| `ip_fw_compat.c` | Compatibility |

### Dummynet (Traffic Shaping)

| File | Purpose |
|------|---------|
| `ip_dummynet.c` | Dummynet main |
| `dn_sched_fifo.c` | FIFO scheduler |
| `dn_sched_rr.c` | Round-robin |
| `dn_sched_prio.c` | Priority |
| `dn_sched_qfq.c` | QFQ scheduler |
| `dn_sched_wf2q.c` | WF2Q+ |
| `dn_sched_fq_codel.c` | FQ-CoDel |
| `dn_sched_fq_pie.c` | FQ-PIE |
| `dn_aqm_codel.c` | CoDel AQM |
| `dn_aqm_pie.c` | PIE AQM |
| `dn_sched.c` | Scheduler core |
| `dn_heap.c` | Heap management |
| `ip_dn_io.c` | Dummynet I/O |

### Dummynet Structures

```c
// Pipe/scheduler
struct dn_iqueue {
    struct dn_flow_set *fs;         // Flow set
    struct mbuf_queue  mq;           // Packet queue
    u_int64_t     len_bytes;        // Byte count
    u_int         len_pkts;         // Packet count
};

struct dn_flow_set {
    u_int16_t    fs_id;             // Set ID
    u_int16_t    fs_type;           // Type
    u_int        fs_mask;           // Mask
    u_int        fs_plr;            // Packet loss rate
    u_int        fs_mtu;            // MTU
    u_int        fs_bandwidth;      // Bandwidth
    u_int        fs_av bandwidth;   // Available bandwidth
    int          (*sched)(...);     // Scheduler
};
```

## Shared Components

| File | Purpose |
|------|---------|
| `in4_cksum.c` | IPv4 checksum |

## Packet Flow

```
 NIC
  │
  ▼
 pfil hook (net/if.c)
  │
  ▼
 IPFW (ip_fw_pfil.c)
  │
  ▼
 PF (pf.c)
  │
  ├── Pass → continue
  ├── Drop → return
  └── NAT → translate → continue
```

## PF Rules Example

```
# pf.conf
block in on em0 all
pass in on em0 proto tcp from any to any port 22
nat on em0 from 192.168.1.0/24 -> 10.0.0.1
```

## IPFW Rules Example

```
ipfw add 100 allow tcp from any to any 22 in via em0
ipfw add 200 nat 1 ip from any to any out via em0
```

## Initialization

```c
// pf.c
static int pf_modevent(module_t mod, int type, void *data)
{
    switch (type) {
    case MOD_LOAD:
        pfil_head_register(&pf_pfil_head);
        break;
    case MOD_UNLOAD:
        pfil_head_unregister(&pf_pfil_head);
        break;
    }
}
```

## Key Dependencies

```c
#include <net/pfvar.h>            // PF definitions
#include <net/if_var.h>           // Interface
#include <netinet/in_var.h>       // INET
#include <netinet/ip_fw.h>         // IPFW
#include <netinet/ip_dummynet.h>  // Dummynet
```

## See Also

- `sys/net/if.c` - Pfil hooks
- `sys/netinet/ip_fw.h` - IPFW header
- `sys/netpfil/pf/` - PF subsystem