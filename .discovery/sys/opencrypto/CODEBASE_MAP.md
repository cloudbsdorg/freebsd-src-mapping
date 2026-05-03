# sys/opencrypto/ — OpenCrypto Framework Codebase Map

**Path:** `sys/opencrypto/`
**Files:** 23 C source files
**Purpose:** Software crypto framework with cryptodev interface

## Overview

OpenCrypto provides a software crypto framework that sits between the cryptodev (/dev/crypto) interface and hardware crypto drivers. It includes cryptosoft (software implementation) and transform definitions.

## Core Framework

| File | Purpose |
|------|---------|
| `crypto.c` | Core framework |
| `cryptosoft.c` | Software crypto driver |
| `cryptodev.c` | /dev/crypto interface |
| `criov.c` | IOV management |

### Key Structures

```c
// Crypto session
struct crypto_session {
    u_int32_t sesikey;           // Session ID
    int       ses_alg;           // Algorithm
    int       ses_mac;           // MAC algorithm
    void      *ses_key;         // Key material
    int       ses_klen;          // Key length
    void      *ses_mackey;       // MAC key
    int       ses_macklen;       // MAC key length
    struct swcr_auth_state *ses_mac_state;
    struct swcr_enc_state *ses_enc_state;
};

// Crypto operation
struct cryptop {
    int             crp_ilen;       // Input length
    int             crp_olen;       // Output length
    caddr_t         crp_buf;        // Data buffer
    caddr_t         crp_obuf;      // Output buffer
    int             crp_skip;        // Header skip
    struct crypto_session *crp_ses; // Session
    int             crp_op;         // Operation
    int             crp_flags;
    void            (*crp_callback)(struct cryptop *);
    int             crp_etype;      // Error type
    int             crp_alg;         // Algorithm
    void            *crp_opaque;     // Opaque data
};
```

## Cryptosoft (Software Implementation)

| File | Purpose |
|------|---------|
| `cryptosoft.c` | Software crypto driver |

### Software State

```c
// Encryption state
struct swcr_enc_state {
    int             es_vm;          // VMAC state
    caddr_t         es_key;         // Key
    u_int8_t        es_iv[MAX_IV_LEN]; // IV
    void            (*es_cop)(...);  // Crypto operation
};

// Authentication state
struct swcr_auth_state {
    int             as_mac;          // MAC type
    caddr_t         as_key;         // Key
    u_int32_t       as_len;         // Length
    void            *as_state;       // State
};
```

## Transform Definitions

| File | Transform | Purpose |
|------|-----------|---------|
| `xform_null.c` | NULL | No encryption |
| `xform_aes_cbc.c` | AES-CBC | AES CBC mode |
| `xform_aes_icm.c` | AES-ICM | AES ICM mode |
| `xform_aes_xts.c` | AES-XTS | AES XTS mode |
| `xform_chacha20_poly1305.c` | ChaCha20-Poly1305 | AEAD |
| `xform_cbc_mac.c` | CBC-MAC | MAC |
| `xform_gmac.c` | GMAC | GMAC |
| `xform_poly1305.c` | Poly1305 | Poly1305 MAC |
| `xform_sha1.c` | SHA1 | SHA-1 hash |
| `xform_sha2.c` | SHA2 | SHA-2 family |
| `xform_rmd160.c` | RMD160 | RIPEMD-160 |
| `xform_deflate.c` | deflate | Compression |
| `xform_cml.c` | CML | Camellia |

### Transform Structure

```c
// Transform definition
struct crypto_transform {
    u_int16_t        crt_id;         // Transform ID
    u_int16_t        crt_alg;        // Algorithm
    u_int32_t        crt_flags;      // Flags
    int              crt_init(...);  // Init
    void             (*crt_enc)(...); // Encrypt
    void             (*crt_dec)(...); // Decrypt
    int              (*crt_setkey)(...); // Set key
    void             (*crt闲着)(...); // Finalize
};
```

## Algorithm Registration

```c
// Register a transform
int crypto_register(u_int alg, u_int16_t id,
    int (*init)(...), void (*crypt)(...),
    void (*crypt_fini)(...), int keylen);

// Unregister
int crypto_unregister(u_int alg, u_int16_t id);
```

## Cipher Modes

### CBC (Cipher Block Chaining)
- xform_aes_cbc.c
- Used for: disk encryption, legacy protocols

### ICM (Integer Counter Mode)
- xform_aes_icm.c
- Used for: IPsec ESP

### XTS (XEX-based tweaked-codebook)
- xform_aes_xts.c
- Used for: disk encryption (IEEE 1619)

## Authentication

### GMAC (Galois MAC)
- xform_gmac.c
- Based on AES-GCM

### Poly1305
- xform_poly1305.c
- Used with ChaCha20

### CBC-MAC
- xform_cbc_mac.c
- Legacy MAC

## Compression

| File | Transform |
|------|-----------|
| `xform_deflate.c` | deflate (RFC 1951) |
| `cryptodeflate.c` | deflate crypto |

## RMD160 (RIPEMD-160)

| File | Purpose |
|------|---------|
| `xform_rmd160.c` | Transform |
| `rmd160.c` | Core implementation |

## GMAC

| File | Purpose |
|------|---------|
| `xform_gmac.c` | Transform |
| `gmac.c` | GMAC implementation |

## GF Multiplication

| File | Purpose |
|------|---------|
| `gfmult.c` | GF(2^128) multiplication |

## Kernel TLS (KTLS)

| File | Purpose |
|------|---------|
| `ktls_ocf.c` | OCF-based KTLS |

## /dev/crypto IOCTLs

```c
// Session management
CIOCGSESSION
CIOCFSESSION
CIOCNGSESSION
CIOCT密钥

// Cryptographic operations
CIOCCRYPTO

// Key management
CIOCKEY
IOCKEY
```

## Initialization

```c
// crypto.c
static int crypto_modevent(module_t mod, int type, void *data)
{
    switch (type) {
    case MOD_LOAD:
        crypto_init();           // Register transforms
        cryptosoft_init();      // Software driver
        break;
    case MOD_UNLOAD:
        crypto_destroy();
        break;
    }
}
```

## Key Dependencies

```c
#include <opencrypto/cryptodev.h>   // /dev/crypto interface
#include <opencrypto/xform.h>       // Transform definitions
#include <sys/crypto.h>             // Core crypto
```

## Relationship to sys/crypto/

```
sys/crypto/         → Low-level algorithms (AES, SHA, etc.)
sys/opencrypto/     → Transform framework + cryptodev
sys/netipsec/       → Uses opencrypto for IPsec
```

## See Also

- `sys/crypto/` - Low-level crypto primitives
- `sys/netipsec/` - IPsec (uses opencrypto)
- `sys/dev/crypto/` - Hardware crypto devices