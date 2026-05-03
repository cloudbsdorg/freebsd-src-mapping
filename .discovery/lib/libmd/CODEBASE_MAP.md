# lib/libmd/ — Message Digest Library Codebase Map

**Path:** `lib/libmd/`
**Purpose:** Message digest (hash) functions

## Overview

libmd provides message digest functions.

## Key Files

| File | Purpose |
|------|---------|
| `md.c` | Main dispatch |
| `sha256.c` | SHA256 |
| `sha512.c` | SHA512 |
| `rmd160.c` | RIPEMD160 |
| `md5.c` | MD5 |

## Key Functions

```c
void EVP_DigestInit(EVP_MD_CTX *, const EVP_MD *);
void EVP_DigestUpdate(EVP_MD_CTX *, const void *, size_t);
void EVP_DigestFinal(EVP_MD_CTX *, unsigned char *, unsigned int *);

const char *EVP_MD_name(const EVP_MD *);
```

## Algorithms

| Algorithm | Functions |
|-----------|-----------|
| MD5 | EVP_md5() |
| SHA1 | EVP_sha1() |
| SHA256 | EVP_sha256() |
| SHA384 | EVP_sha384() |
| SHA512 | EVP_sha512() |
| RIPEMD160 | EVP_ripemd160() |

## See Also

- `lib/libcrypto/` - OpenSSL crypto