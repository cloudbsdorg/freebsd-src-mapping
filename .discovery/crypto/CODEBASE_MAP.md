# crypto/ — Cryptographic Software Codebase Map

**Path:** `crypto/`
**Purpose:** Cryptographic software (OpenSSL, OpenSSH, Heimdal)

## Overview

The crypto directory contains cryptographic software.

## OpenSSL

| Directory | Description |
|-----------|-------------|
| `openssl/` | OpenSSL 3.x library |

## Heimdal Kerberos

| Directory | Description |
|-----------|-------------|
| `heimdal/` | Heimdal Kerberos 5 |

## OpenSSH

| Directory | Description |
|-----------|-------------|
| `openssh/` | OpenSSH client/server |

## License Notes

Each subdirectory has its own license:
- OpenSSL: Apache + BSD
- Heimdal: BSD
- OpenSSH: BSD

## See Also

- `lib/libcrypto/` - OpenSSL in lib/
- `lib/libssl/` - OpenSSL SSL in lib/