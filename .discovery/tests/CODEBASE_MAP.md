# tests/ — Test Suite Codebase Map

**Path:** `tests/`
**Purpose:** FreeBSD test suite using Kyua

## Overview

The tests directory contains the FreeBSD test suite, runnable via Kyua.

## Directory Structure

```
tests/
├── atf_python/           # Python ATF tests
├── freebsd_test_suite/  # Main test suite
├── sys/                # Kernel tests
│   ├── kern/           # Kernel tests
│   ├── net/             # Network tests
│   ├── fs/              # Filesystem tests
│   ├── vm/              # VM tests
│   └── ...
├── Kyuafile            # Test specification
└── README
```

## Running Tests

```bash
# Run all tests
make test

# Run specific test
kyua test -t tests/Kyuafile

# Run kernel tests
cd tests/sys && make
```

## Test Categories

| Category | Description |
|----------|-------------|
| `sys/kern/` | Kernel subsystem tests |
| `sys/net/` | Network tests |
| `sys/fs/` | Filesystem tests |
| `sys/netinet/` | IPv4 tests |
| `sys/netinet6/` | IPv6 tests |
| `sys/vm/` | VM tests |
| `sys/security/` | Security tests |
| `lib/` | Library tests |
| `usr.bin/` | Command tests |
| `usr.sbin/` | Admin command tests |

## Kyuafile Format

```
syntax(kyua 2.1)

include(..../Kyuafile.base)

test_suite("freebsd_test_suite") {
    # Test suites
}
```

## See Also

- `contrib/kyua/` - Kyua testing framework