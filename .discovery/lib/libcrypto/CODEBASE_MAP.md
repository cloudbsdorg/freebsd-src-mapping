# lib/libcrypto/ — OpenSSL Crypto Library Codebase Map

**Path:** `lib/libcrypto/`
**Purpose:** OpenSSL cryptographic library

## Overview

libcrypto provides general-purpose cryptographic functions.

## Key Files

| File | Purpose |
|------|---------|
| `crypto/` | Core crypto |
| `evp/` | High-level API |
| `asn1/` | ASN.1 |
| `x509/` | X.509 certificates |
| `pem/` | PEM encoding |
| `bio/` | BIO I/O |
| `conf/` | Configuration |
| `objects/` | OID objects |

## Algorithms

### Ciphers

| Algorithm | Files |
|-----------|-------|
| AES | `crypto/aes/` |
| DES | `crypto/des/` |
| 3DES | `crypto/des/` |
| RC4 | `crypto/rc4/` |
| ChaCha20 | `crypto/chacha/` |
| Blowfish | `crypto/bf/` |

### Hashes

| Algorithm | Files |
|-----------|-------|
| MD5 | `crypto/md5/` |
| SHA1 | `crypto/sha/` |
| SHA2 | `crypto/sha/` |
| SHA3 | `crypto/sha3/` |

### Public Key

| Algorithm | Files |
|-----------|-------|
| RSA | `crypto/rsa/` |
| DSA | `crypto/dsa/` |
| DH | `crypto/dh/` |
| EC | `crypto/ec/` |
| Ed25519 | `crypto/ed25519/` |

## Key Functions

```c
// EVP (high-level)
EVP_MD_CTX *EVP_MD_CTX_new(void);
int EVP_DigestInit_ex(EVP_MD_CTX *, const EVP_MD *, ENGINE *);
int EVP_DigestUpdate(EVP_MD_CTX *, const void *, size_t);
int EVP_DigestFinal_ex(EVP_MD_CTX *, unsigned char *, unsigned int *);
void EVP_MD_CTX_free(EVP_MD_CTX *);

EVP_CIPHER_CTX *EVP_CIPHER_CTX_new(void);
int EVP_EncryptInit_ex(EVP_CIPHER_CTX *, const EVP_CIPHER *, ENGINE *, const unsigned char *, const unsigned char *);
int EVP_EncryptUpdate(EVP_CIPHER_CTX *, unsigned char *, int *, const unsigned char *, int);
int EVP_EncryptFinal_ex(EVP_CIPHER_CTX *, unsigned char *, int *);

// RSA
RSA *RSA_generate_key(int bits, unsigned long e, void (*callback)(int, int, void *), void *cb_arg);
int RSA_free(RSA *);
int RSA_public_encrypt(int flen, const unsigned char *from, unsigned char *to, RSA *rsa, int padding);
int RSA_private_decrypt(int flen, const unsigned char *from, unsigned char *to, RSA *rsa, int padding);
```

## See Also

- `lib/libssl/` - SSL/TLS
- `crypto/openssl/` - OpenSSL source