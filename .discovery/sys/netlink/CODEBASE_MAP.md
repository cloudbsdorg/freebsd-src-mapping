# sys/netlink/ — Netlink Codebase Map

**Path:** `sys/netlink/`
**Files:** 10 C source files
**Purpose:** Netlink kernel-userspace communication

## Overview

Netlink is a socket-based IPC mechanism for kernel-user communication, used primarily for routing and network configuration. It's modeled after Linux's netlink.

## Core Files

| File | Purpose |
|------|---------|
| `netlink_module.c` | Module entry point |
| `netlink_io.c` | I/O operations |
| `netlink_glue.c` | Kernel glue |

## Message Handling

| File | Purpose |
|------|---------|
| `netlink_message_parser.c` | Message parsing |
| `netlink_message_writer.c` | Message writing |
| `netlink_generic.c` | Generic netlink |

## Routing

| File | Purpose |
|------|---------|
| `netlink_route.c` | Route netlink |

## System Events

| File | Purpose |
|------|---------|
| `netlink_sysevent.c` | System events |

## Domain

| File | Purpose |
|------|---------|
| `netlink_domain.c` | Domain operations |

## Testing

| File | Purpose |
|------|---------|
| `ktest_netlink_message_writer.c` | Test utilities |

## Netlink Socket

```c
struct nlmsghdr {
    u_int32_t nlmsg_len;           // Length
    u_int16_t nlmsg_type;          // Message type
    u_int16_t nlmsg_flags;         // Flags
    u_int32_t nlmsg_seq;           // Sequence
    u_int32_t nlmsg_pid;           // PID
};
```

### Netlink Message Types

```c
// Generic netlink
NETLINK_ROUTE              // Routing table
NETLINK_GENERIC            // Generic netlink

// Route family
RTM_NEWLINK                // New interface
RTM_DELLINK                // Delete interface
RTM_GETLINK                // Get interface
RTM_SETLINK                // Set interface
RTM_NEWROUTE               // New route
RTM_DELROUTE               // Delete route
RTM_GETROUTE               // Get route
RTM_NEWNEIGH               // New neighbor
RTM_DELNEIGH               // Delete neighbor
RTM_GETNEIGH               // Get neighbor
```

## Socket Creation

```c
// Create netlink socket
struct socket *so;
error = netlink_socket(NETLINK_ROUTE, &so);

// Receive messages
struct nlmsghdr *nlh;
error = netlink_recv(so, &nlh, &len);

// Send messages
error = netlink_send(so, nlh, len);
```

## Message Attributes

```c
// Netlink attribute
struct nlattr {
    u_int16_t nla_len;            // Length
    u_int16_t nla_type;           // Type
    char      nla_data[0];        // Data
};
```

## Kernel Operations

```c
// Register a netlink protocol
int netlink_register(int protocol, struct netlink_ops *ops);

// Unregister
int netlink_unregister(int protocol);
```

## Generic Netlink

Generic netlink provides a framework for kernel modules to expose their own protocols:

```c
// Generic family
struct genl_family {
    u_int16_t gf_id;              // Family ID
    char      gf_name[16];       // Name
    u_int16_t gf_version;         // Version
    u_int16_t gf_hdrsize;         // Header size
    u_int32_t gf_attrs;           // Attributes
};
```

## Testing

```c
// ktest_netlink_message_writer.c
void netlink_test_message_writer(void);
```

## Key Dependencies

```c
#include <netlink/netlink.h>         // Netlink header
#include <netlink/netlink_route.h> // Route
#include <netlink/netlink_generic.h> // Generic
```

## See Also

- `sys/net/route.c` - Routing (netlink hooks)
- `sys/net/if.c` - Interface (netlink hooks)
- Linux netlink documentation