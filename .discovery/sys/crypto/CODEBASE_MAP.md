# sys/crypto/ — Kernel Cryptography Framework Codebase Map

**Path:** `sys/crypto/`
**Files:** 68 C source files across subdirectories
**Purpose:** Cryptographic algorithms, hardware acceleration, cryptodev

## Overview

The crypto directory provides kernel-based cryptographic primitives and hardware acceleration. It includes symmetric ciphers, hash functions, AEAD modes, and hardware driver support.

## Cryptographic Hashes

### SHA Family

| Directory | Files | Purpose |
|-----------|-------|---------|
| `sha1.c` | SHA1 implementation |
| `sha2/` | sha256c.c, sha512c.c, sha256c_arm64.c, sha512c_arm64.c | SHA-256, SHA-512 |
| `openssl/ossl_sha*.c` | OpenSSL SHA implementations |

### Other Hashes

| Directory | Files | Purpose |
|-----------|-------|---------|
| `md4c.c` | MD4 hash |
| `md5c.c` | MD5 hash |
| `blake2/` | blake2*-*.c | BLAKE2 (s, b variants) with SSE/AVX |
| `siphash/` | siphash.c, siphash_test.c | SipHash-2-4 |

## Symmetric Ciphers

### AES

| Directory | Files | Purpose |
|-----------|-------|---------|
| `aesni/` | aesni.c, aesni_ccm.c, aesni_wrap.c, aesni_ghash.c, intel_sha*.c | Intel AES-NI |
| `openssl/ossl_aes*.c` | AES from OpenSSL |
| `rijndael/` | rijndael-*.c | Reference AES |

### Other Ciphers

| Directory | Files | Purpose |
|-----------|-------|---------|
| `rc4/rc4.c` | RC4 stream cipher |
| `des/` | des_*.c | DES/3DES |
| `camellia/` | camellia*.c | Camellia |
| `chacha20/` | chacha.c, chacha-sw.c | ChaCha20 |
| `chacha20_poly1305.c` | ChaCha20-Poly1305 AEAD |
| `curve25519.c` | X25519 key exchange |

## AEAD (Authenticated Encryption)

| File | Algorithm |
|------|-----------|
| `openssl/ossl_aes_gcm.c` | AES-GCM |
| `openssl/arm/ossl_aes_gcm_neon.c` | AES-GCM NEON |
| `openssl/amd64/ossl_aes_gcm_avx512.c` | AES-GCM AVX-512 |
| `openssl/ossl_chacha20.c` | ChaCha20-Poly1305 |
| `openssl/ossl_poly1305.c` | Poly1305 MAC |
| `aesni/aesni_ccm.c` | AES-CCM |
| `aesni/aesni_ghash.c` | GHASH (for GCM) |

## Hardware Accelerators

### Intel AES-NI (aesni/)

| File | Purpose |
|------|---------|
| `aesni.c` | AES enc/dec with AES-NI |
| `aesni_ccm.c` | AES-CCM mode |
| `aesni_wrap.c` | Key wrapping |
| `aesni_ghash.c` | GHASH (GCM mode) |
| `intel_sha1.c` | SHA-1 using AES-NI |
| `intel_sha256.c` | SHA-256 using AES-NI |

### VIA PadLock (via/)

| File | Purpose |
|------|---------|
| `padlock.c` | PadLock driver |
| `padlock_cipher.c` | Cipher operations |
| `padlock_hash.c` | Hash operations |

### AMD CCP (ccp/)

| File | Purpose |
|------|---------|
| `ccp.c` | CCP driver |
| `ccp_hardware.c` | Hardware interface |
| `ccp_lsb.c` | CCP LSB (Linux Shadow Buffer) |

### ARM Cryptography (armv8/, openssl/)

| File | Purpose |
|------|---------|
| `armv8/armv8_crypto.c` | ARMv8 crypto |
| `armv8/armv8_crypto_wrap.c` | ARMv8 wrapper |
| `openssl/ossl_aarch64.c` | AArch64 OpenSSL |
| `openssl/ossl_arm.c` | ARM OpenSSL |

### SHA Extensions

| File | Purpose |
|------|---------|
| `openssl/ossl_x86.c` | x86 SHA |
| `openssl/ossl_ppc.c` | PowerPC SHA |

## Random Number Generation

| Directory | Files | Purpose |
|-----------|-------|---------|
| `libsodium/` | randombytes.c, utils.c | libsodium random |

## Hash+MAC Algorithms

| Algorithm | Files |
|-----------|-------|
| HMAC-SHA1 | Built into sha1.c |
| HMAC-SHA2 | Built into sha2/ |
| Poly1305 | openssl/ossl_poly1305.c |
| SipHash | siphash/siphash.c |

## Software Implementations

| Directory | Files | Purpose |
|-----------|-------|---------|
| `blake2/blake2-sw.c` | BLAKE2 software |
| `chacha20/chacha-sw.c` | ChaCha20 software |

## Cryptodev (Userland Access)

| File | Purpose |
|------|---------|
| `blake2/blake2_cryptodev.c` | ioctl interface for BLAKE2 |
| `sha1.c`, `md5c.c` | crpytodev hash interface |

## OpenSSL Compatibility

| Directory | Files | Purpose |
|-----------|-------|---------|
| `openssl/` | ossl.c | OpenSSL wrapper |
| `openssl/ossl_aes.c` | AES |
| `openssl/ossl_chacha20.c` | ChaCha20 |
| `openssl/ossl_sha*.c` | SHA family |
| `openssl/ossl_poly1305.c` | Poly1305 |

## Key Structure

```c
struct crypto_buffer {
    caddr_t         cb_buf;         // Data buffer
    int             cb_buf_len;     // Buffer length
    int             cb_offset;      // Current offset
};

// Generic crypto operation
struct cryptop {
    int             crp_ilen;       // Input length
    int             crp_olen;       // Output length
    caddr_t         crp_buf;        // Data buffer
    caddr_t         crp_obuf;      // Output buffer
    int             crp_skip;       // Skip bytes
    struct crypto_session *crp_ses; // Session
    int             crp_op;         // Operation (COP_ENCRYPT, etc.)
    int             crp_flags;
    void            (*crp_callback)(struct cryptop *);
    void            *crp_desc;      // Descriptor (e.g., uhmac_ctx) ?
};
```

## Session Management

```c
struct crypto_session {
    struct crypto_session_ops *cs_ops;
    void                      *cs_private;
    int                       cs_alg;
    int                       cs_flags;
};
```

## Algorithm IDs

```c
#define CRYPTO_SHA1         1
#define CRYPTO_SHA2_256     2
#define CRYPTO_SHA2_384     3
#define CRYPTO_SHA2_512     4
#define CRYPTO_AES_CBC      5
#define CRYPTO_AES_ICM      6
#define CRYPTO_CHACHA20     7
#define CRYPTO_POLY1305     8
#define CRYPTO_AES_GCM      9
// ... many more
```

## Cryptodev IOCTLs

```c
CIOCCRYPTOT
CIOCGSESSION
CIOCFSESSION
CIOCKEY
IOCKEY
CIOCNGSESSION
CIOCCRYPOT
```

## Initialization

```c
// crypto subsystem uses module system
static int crypto_modevent(module_t mod, int type, void *data)
{
    switch (type) {
    case MOD_LOAD:
        crypto_init();              // Register algorithms
        break;
    case MOD_UNLOAD:
        crypto_uninit();            // Unregister
        break;
    }
}
```

## Key Dependencies

```c
#include <sys/crypto.h>             // Core crypto
#include <sys/cryptodev.h>         // /dev/crypto
#include <opencrypto/cryptodev.h>  // User-visible crypto
#include <crypto/sha1.h>           // SHA1
#include <crypto/sha2.h>           // SHA2
```

## See Also

- `sys/opencrypto/` - OpenCrypto framework
- `sys/netipsec/` - IPsec (uses crypto)
- `sys/dev/crypto/` - Cryptodev device