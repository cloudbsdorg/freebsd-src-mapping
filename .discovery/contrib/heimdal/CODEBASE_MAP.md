# contrib/heimdal/ — Heimdal Kerberos Codebase Map

**Path:** `contrib/heimdal/`
**Purpose:** Heimdal Kerberos 5 implementation

## Overview

Heimdal is a Kerberos 5 implementation used by FreeBSD.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `lib/` | Libraries |
| `kdc/` | KDC daemon |
| ` kadmind/` | Admin daemon |
| ` kpasswdd/` | Password daemon |

## Key Libraries

| Library | Purpose |
|---------|---------|
| `lib/krb5/` | Kerberos 5 |
| `lib/hdb/` | HDB (database) |
| `lib/asn1/` | ASN.1 |
| `lib/roken/` | Base utilities |

## KDC Components

| File | Purpose |
|------|---------|
| `kdc/main.c` | KDC main |
| `kdc/kdc_process.c` | Request process |
| `kdc/kerberos5.c` | K5 handling |
| `kdc/mitLM.c` | Legacy compat |

## Admin Components

| File | Purpose |
|------|---------|
| `kadmind/probes.c` | Admin probes |
| `kpasswdd/main.c` | Passwd daemon |

## See Also

- `crypto/heimdal/` - Alternative heimdal
- `sys/krb5/` - Kerberos in kernel