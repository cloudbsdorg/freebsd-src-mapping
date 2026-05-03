# share/ — Share and Tests Codebase Map

**Path:** `share/`, `tests/`, `tools/`

## Overview

The share and tests directories contain shared resources, documentation, and test infrastructure.

---

## share/ — Shared Resources

**Path:** `share/`

### Man Pages & Documentation

| Directory | Description |
|-----------|-------------|
| `man/` | Manual pages |
| `doc/` | Documentation |
| `mk/` | Build makefiles |

### Locale & Internationalization

| Directory | Description |
|-----------|-------------|
| `i18n/` | Internationalization |
| `zoneinfo/` | Timezone data |
| `colldef/` | Collation definitions |
| `msgdef/` | Message definitions |

### System Resources

| Directory | Description |
|-----------|-------------|
| `dict/` | Word lists |
| `skel/` | Skeleton files |
| `termcap/` | Terminal capabilities |
| `vt/` | VT fonts |

### Examples & Templates

| Directory | Description |
|-----------|-------------|
| `examples/` | Example configurations |
| `security/` | Security templates |

---

## tests/ — Kyua Test Suite

**Path:** `tests/`

### Structure

```
tests/
├── atf_python/         # Python ATF tests
├── freebsd_test_suite/ # Main test suite
├── sys/               # Kernel tests
├── Kyuafile           # Test specification
└── README             # Test documentation
```

### Running Tests

```bash
# Run all tests
make test

# Run specific test
kyua test -t tests/Kyuafile

# Run kernel tests
cd tests/sys && make
```

### Test Categories

| Category | Description |
|----------|-------------|
| `sys/` | Kernel-level tests |
| `usr.bin/` | User command tests |
| `usr.sbin/` | Admin command tests |
| `lib/` | Library tests |

---

## tools/ — Ancillary Utilities

**Path:** `tools/`

### Categories

| Directory | Description |
|-----------|-------------|
| `boot/` | Boot-related tools |
| `build/` | Build tools |
| `debug/` | Debugging tools |
| `regression/` | Regression tests |

### Key Tools

| Tool | Description |
|------|-------------|
| `install.sh` | Install script |
| `tinder.sh` | Tinderbox script |
| `coccinelle/` | Coccinelle scripts |

---

## Build System

### Share

```bash
# Build man pages
cd share && make

# Install share
make installworld
```

### Tests

```bash
# Build tests
make -C tests

# Run tests
cd tests && kyua test
```