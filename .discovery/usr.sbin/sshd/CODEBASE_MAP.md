# usr.sbin/sshd/ — SSH Daemon Codebase Map

**Path:** `usr.sbin/sshd/`
**Purpose:** OpenSSH SSH daemon

## Overview

sshd is the SSH daemon that accepts connections.

## Key Files

| File | Purpose |
|------|---------|
| `sshd.c` | Main |
| `sshpty.c` | PTY |
| `session.c` | Session |
| `auth.c` | Authentication |
| `auth2.c` | Auth v2 |
| `packet.c` | Packet |
| `channels.c` | Channels |
| `clientloop.c` | Client loop |
| `serverloop.c` | Server loop |
| `mux.c` | Multiplexing |

## Key Functions

```c
int main(int, char **);
void server_accept_loop(int, int);
```

## See Also

- `crypto/openssh/` - Source