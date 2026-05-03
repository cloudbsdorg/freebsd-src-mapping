# sys/netgraph/ — Netgraph Framework Codebase Map

**Path:** `sys/netgraph/`
**Files:** 49 C source files
**Purpose:** Modular kernel networking framework for arbitrary protocol processing graphs

## Overview

Netgraph is a kernel networking framework that allows creation of arbitrary directed graphs of processing nodes. Each node type implements a specific protocol or function. Nodes are connected via hooks, and data flows as mbufs through the graph.

## Core Framework

| File | Purpose | Key Structures |
|------|---------|---------------|
| `ng_base.c` | Core framework | `ng_node`, `ng_hook`, `ng_mbufq` |
| `ng_parse.c` | Configuration parsing | `ng_parse_struct`, `ng_parse_array` |

### Netgraph Node Structure

```c
struct ng_node {
    TAILQ_ENTRY(ng_node) noder;
    char    node_name[NG_NODESIZ];
    const struct ng_type *type;     // Node type
    void    *node_private;          // Type-specific data
    struct  ng_hook **hooks;        // Hook array
    u_int   numhooks;
    int     refs;                    // Reference count
};

struct ng_hook {
    struct  ng_node *hook_node;     // This node
    char    hook_name[NG_HOOKSIZ];
    struct  ng_node *hook_other;    // Peer node
    struct  ng_hook *hook_otherhook;// Peer hook
    struct  ng_mbufq hook_q;        // Packet queue
};
```

### Node Type Definition

```c
struct ng_type {
    int     version;                // NG_VERSION
    const char *name;              // Node type name
    size_t  private_size;          // Size of private data
    int     (*constructor)(node, args);  // Create node
    int     (*rcvmsg)(node, sock, msg);   // Handle message
    int     (*rcvdata)(hook, mbuf);       // Receive data
    int     (*close)(node);                // Shutdown
    int     (*modcmd)(cmd, data); // Module command
};
```

## Interface Nodes

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_iface.c` | `iface` | Network interface |
| `ng_eiface.c` | `eiface` | Ethernete interface |
| `ng_device.c` | `device` | Generic device |

## Socket Nodes

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_socket.c` | `socket` | BSD socket interface |
| `ng_ksocket.c` | `ksocket` | Kernel socket |

## Ethernet Nodes

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_ether.c` | `ether` | Ethernet interface |
| `ng_bridge.c` | `bridge` | Ethernet bridge |
| `ng_ether_echo.c` | `ether_echo` | Ethernet echo |
| `ng_macfilter.c` | `macfilter` | MAC address filtering |

## Firewall / Packet Processing

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_ipfw.c` | `ipfw` | IPFW firewall |
| `ng_nat.c` | `nat` | NAT |
| `ng_car.c` | `car` | Committed Access Rate (rate limiting) |
| `ng_bpf.c` | `bpf` | BPF filter |

## VLAN / Tunneling

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_vlan.c` | `vlan` | 802.1Q VLAN |
| `ng_vlan_rotate.c` | `vlan_rotate` | VLAN rotation |
| `ng_gif.c` | `gif` | Generic tunnel |
| `ng_gif_demux.c` | `gif` | GIF demux |
| `ng_tunnel.c` | `tunnel` | Tunnel (in ng_gif) |

## PPP / Serial

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_ppp.c` | `ppp` | PPP |
| `ng_async.c` | `async` | Async PPP |
| `ng_pppoe.c` | `pppoe` | PPPoE |
| `ng_pptpgre.c` | `pptpgre` | PPTP GRE |
| `ng_l2tp.c` | `l2tp` | L2TP |
| `ng_tty.c` | `tty` | TTY interface |
| `ng_rfc1490.c` | `rfc1490` | RFC 1490 (frame relay) |
| `ng_frame_relay.c` | `frame_relay` | Frame Relay |
| `ng_lmi.c` | `lmi` | LMI |
| `ng_cisco.c` | `cisco` | Cisco |

## Packet Modification

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_patch.c` | `patch` | Modify packet bytes |
| `ng_tag.c` | `tag` | Tag packet with metadata |
| `ng_vjc.c` | `vjc` | Van Jacobson compression |
| `ng_tcpmss.c` | `tcpmss` | TCP MSS clamping |
| `ng_checksum.c` | `cksum` | Checksum offload |
| `ng_pred1.c` | `pred1` | Predictor-1 compression |
| `ng_deflate.c` | `deflate` | Deflate compression |
| `ng_mppc.c` | `mppc` | MPPC compression |

## Packet Distribution

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_split.c` | `split` | Fork packets to multiple hooks |
| `ng_one2many.c` | `one2many` | One input to many outputs |
| `ng_hub.c` | `hub` | Broadcast to all hooks |
| `ng_tee.c` | `tee` | Duplicate to both hooks |
| `ng_source.c` | `source` | Generate packets |
| `ng_sample.c` | `sample` | Sample packets |

## Utility Nodes

| File | Node Type | Purpose |
|------|-----------|---------|
| `ng_echo.c` | `echo` | Echo packets back |
| `ng_hole.c` | `hole` | Pass packets, drop on overflow |
| `ng_pipe.c` | `pipe` | Virtual pipe with bandwidth limit |
| `ng_UI.c` | `UI` | User-interface |
| `ng_etf.c` | `etf` | Ethernet Token Ring Format |
| `ng_ip_input.c` | `ip_input` | IP input processing |

## Packet Flow in Netgraph

```
Application
    │
    │ socket()
    ▼
ng_ksocket node
    │
    │ recvdata
    ▼
[Processing nodes...]
    │
    │ recvdata
    ▼
ng_ether node → NIC driver
```

## Creating a Netgraph Graph

```c
// Create nodes
ng_mkpeer(gsock, NG_IPFW_NODE_TYPE, "fw");

// Connect nodes
ng_connect(node1, "outhook", node2, "inhook");

// Send data
NG_SEND_DATA(error, outhook, mbuf);

// Configuration via socket
ng_send_msg(socket, &msg);
```

## Message Passing

Netgraph nodes communicate via messages:

```c
struct ng_mesg {
    char    ngm_header[NG_HEADER_SIZE];
    char    ngm_data[0];
};

struct ng header {
    int     version;
    int     type;              // NGM_* type
    int     flags;
    size_t  len;               // Total message length
    char    cmd[NG_CMDLEN];    // Command
};
```

## Control Messages (NGM_*)

```c
// Generic
NGM_GENERIC_ID
NGM_GENERIC_NODE_INFO
NGM_GENERIC_NODE_LIST
NGM_GENERIC_PEER_INFO
NGM_GENERIC_PEER_LIST

// Node-specific
NGM_IPFW_GET_CONFIG
NGM_NAT_CONFIG
// etc.
```

## Reference Counting

```c
// Each node has a reference count
struct ng_node {
    int refs;  // Reference count
};

// Operations
ng_ref_node(node);    // Increment
ng_unref_node(node);  // Decrement and free if 0
```

## Initialization

```c
// ng_base.c
static int ng_modevent(module_t mod, int type, void *data)
{
    switch (type) {
    case MOD_LOAD:
        ng_confsw_init();      // Initialize type switch table
        break;
    case MOD_UNLOAD:
        ng_confsw_fini();
        break;
    }
}
```

## Key Dependencies

```c
#include <netgraph/ng_socket.h>    // Socket interface
#include <netgraph/ng_message.h>  // Message types
#include <netgraph/ng_parse.h>    // Parsing framework
#include <netgraph/ng_node.h>      // Node structures
#include <netgraph/ng_hook.h>      // Hook structures
#include <net/netgraph.h>          // Generic netgraph
```

## See Also

- `sys/net/if.c` - Network interface
- `sys/netinet/ip_fw.h` - IPFW
- `sys/netpfil/pf.c` - PF firewall