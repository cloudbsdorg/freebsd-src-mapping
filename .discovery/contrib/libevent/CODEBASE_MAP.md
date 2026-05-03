# contrib/libevent/ — Libevent Source Codebase Map

**Path:** `contrib/libevent/`
**Purpose:** Event library source

## Overview

libevent provides event notification for network applications.

## Key Files

| File | Purpose |
|------|---------|
| `event.c` | Core event |
| `event-internal.h` | Internal |
| `epoll.c` | epoll |
| `kqueue.c` | kqueue |
| `select.c` | select |
| `poll.c` | poll |
| `evbuffer.c` | Buffers |
| `evthread.c` | Threading |
| `listener.c` | TCP listener |
| `bufferevent/` | Buffered I/O |

## Event Backends

```mermaid
flowchart TD
    A[event_base] --> B[kqueue<br/>BSD, macOS]
    A --> C[epoll<br/>Linux]
    A --> D[select<br/>portable]
    A --> E[poll<br/>portable]
```

## See Also

- `lib/libevent/` - FreeBSD integrated