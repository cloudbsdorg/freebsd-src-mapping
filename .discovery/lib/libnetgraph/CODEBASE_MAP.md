# lib/libnetgraph/ — Netgraph Library Codebase Map

**Path:** `lib/libnetgraph/`
**Purpose:** Userland netgraph support

## Overview

libnetgraph provides userland library for netgraph.

## Key Files

| File | Purpose |
|------|---------|
| `netgraph.c` | Main |
| `netgraph.h` | Header |
| `ng_socket.c` | Socket |

## Key Structures

```c
struct ngm_conn {
    int fd;
    char path[NG_PATHSIZ];
    struct nodeinfo info;
};
```

## Key Functions

```c
int NgMkSocket(char *, struct socket **, struct ngm_cfg *, size_t);
int NgSendMsg(int, const char *, u_long, int, const void *, size_t);
int NgRecvMsg(int, struct ng_mesg *, int, struct timeval *);
int NgSendData(int, const char *, int, const void *, size_t);
int NgRecvData(int, void *, size_t, int *);
```

## See Also

- `sys/netgraph/` - Kernel netgraph