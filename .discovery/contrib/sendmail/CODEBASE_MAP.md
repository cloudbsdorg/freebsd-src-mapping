# contrib/sendmail/ — Sendmail MTA Codebase Map

**Path:** `contrib/sendmail/`
**Purpose:** Sendmail Mail Transfer Agent

## Overview

Sendmail is a mail transfer agent (MTA).

## Key Files

| File | Purpose |
|------|---------|
| `sendmail/` | Main |
| `mail.local/` | Local delivery |
| `mailstats/` | Stats |
| `praliases/` | Aliases |
| `editmap/` | Map editor |
| `mailq/` | Mail queue |

## sendmail/

| File | Purpose |
|------|---------|
| `readcf.c` | Read config |
| `main.c` | Main |
| `sendmail.h` | Header |
| `arrival.c` | Arrival |
| `clock.c` | Time |
| `collect.c` | Collect |
| `deliver.c` | Delivery |
| `envelope.c` | Envelope |
| `err.c` | Errors |
| `headers.c` | Headers |
| `macro.c` | Macros |
| `parseaddr.c` | Parse |
| `queue.c` | Queue |
| `recipient.c` | Recipients |
| `srvrsmtp.c` | SMTP server |
| `sysexits.c` | Exit codes |
| `users.c` | Users |

## See Also

- `usr.sbin/sendmail/` - Installed binary