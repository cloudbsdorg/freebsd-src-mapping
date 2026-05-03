# Core Standards — Codebase Map

**Source:** https://github.com/cloudbsdorg/application_guidelines/tree/main
**Category:** Core Development Standards

## Overview

The Core Standards section contains the fundamental building blocks that every CloudBSD application must follow. These are mandatory requirements, not suggestions.

## Documents

### Languages/LANGUAGES.md

**Purpose:** Programming language selection criteria and recommended languages for different use cases.

**Key Topics:**
- Language selection matrix
- Recommended languages: C, C++, Rust, Go, Python, TypeScript
- Task-based language recommendations
- Justification for language choices

**Related Documents:**
- `../user-interfaces/TUI.md` (for TUI language choices)
- `../user-interfaces/WEBUI.md` (for web language choices)

---

### Configuration Files/CONFIGURATION.md

**Purpose:** Configuration management, storage standards, and security practices.

**Key Topics:**
- XDG Base Directory Specification compliance
- Configuration file locations
- rc.d script conventions
- Secrets management (no hardcoded credentials)
- Environment variable handling
- Default configuration standards

**Related Documents:**
- `../Planning/PLANNING.md` (project planning)
- `../Unit Testing/UNITTESTS.md` (testing configuration)

---

### Internationalization/INTERNATIONALIZATION.md

**Purpose:** i18n requirements, encoding standards, and localization support.

**Key Topics:**
- UTF-8 encoding requirement (mandatory everywhere)
- gettext usage for translations
- i18next for web interfaces
- ICU for complex text processing
- Supported languages
- Localization best practices

**Related Documents:**
- `../user-interfaces/WEBUI.md` (web i18n)
- `../user-interfaces/TUI.md` (TUI i18n)

---

### Unit Testing/UNITTESTS.md

**Purpose:** Testing philosophy, coverage targets, and CI integration requirements.

**Key Topics:**
- Test-driven development (TDD) requirement
- 80% code coverage target (100% for critical paths)
- Testing frameworks by language:
  - C/C++: Google Test
  - Python: pytest
  - JavaScript/TypeScript: Jest
  - Rust: cargo test
- CI integration requirements
- Mock and stub conventions
- Test naming conventions

**Related Documents:**
- `Testing Infrastructure/TESTING_INFRASTRUCTURE.md` (infrastructure testing)
- `../Planning/PLANNING.md` (test planning)

---

### Testing Infrastructure/TESTING_INFRASTRUCTURE.md

**Purpose:** VMM/bhyve VMs and FreeBSD jails for safe, isolated kernel and userland testing.

**Key Topics:**
- bhyve VM setup and management
- FreeBSD jail configuration
- ZFS for test isolation
- vm-bhyve framework usage
- Kernel module testing (never on host)
- Userland application testing
- CI/CD integration

**Critical Safety Rule:** Untested kernel modules must **never** be loaded on the development host.

**Related Documents:**
- `../Unit Testing/UNITTESTS.md` (unit testing)
- `../../SKILLS/bhyve-manager.md` (bhyve skill)
- `../../SKILLS/jail-manager.md` (jail skill)
- `../../SKILLS/zfs-manager.md` (ZFS skill)

---

### Planning/PLANNING.md

**Purpose:** Standards for `.plan/` directories, task tracking, and multi-agent coordination.

**Key Topics:**
- `.plan/` directory structure
- Document naming conventions (e.g., `0001-`, `0100-`, `0200-`)
- Task table format
- Agent entry point generation
- Maintenance procedures
- Example layouts

**Related Documents:**
- `chapters/0001-Planning-Directory-Layout.md`
- `chapters/0002-Planning-Document-Naming.md`
- `chapters/0003-Planning-Document-Structure.md`
- `chapters/0004-Planning-Task-Tables.md`
- `chapters/0005-Planning-Agent-Entry-Point.md`
- `chapters/0006-Planning-Maintenance.md`
- `chapters/0007-Planning-Example-Layout.md`
- `chapters/0008-Planning-Conventions.md`
- `chapters/0009-Planning-References.md`
- `chapters/0010-Planning-ChangeLog.md`

## Dependency Graph

```
Languages/LANGUAGES.md
         │
         ▼
Configuration Files/CONFIGURATION.md
         │
         ▼
Internationalization/INTERNATIONALIZATION.md
         │
         ▼
Unit Testing/UNITTESTS.md ────────► Testing Infrastructure/TESTING_INFRASTRUCTURE.md
         │                                           │
         │                                           │
         └─────────────────┬───────────────────────┘
                           │
                           ▼
                   Planning/PLANNING.md
```

## Quick Reference Matrix

| Task Domain | Document | Key Tech Stack |
|-------------|----------|----------------|
| Choosing a language | `Languages/LANGUAGES.md` | C, C++, Rust, Go, Python, TypeScript |
| Configuration & settings | `Configuration Files/CONFIGURATION.md` | JSON, XDG Base Directory, rc.d |
| Internationalization | `Internationalization/INTERNATIONALIZATION.md` | gettext, i18next, ICU |
| Unit testing | `Unit Testing/UNITTESTS.md` | Google Test, pytest, Jest, cargo test |
| Testing infrastructure | `Testing Infrastructure/TESTING_INFRASTRUCTURE.md` | bhyve, FreeBSD jails, ZFS |
| Project planning | `Planning/PLANNING.md` | `.plan/` directory |