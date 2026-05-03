# CloudBSD Application Guidelines — Codebase Map

**Source Repository:** https://github.com/cloudbsdorg/application_guidelines
**License:** BSD 3-Clause
**Language:** Shell (100%)

## Repository Overview

This repository contains the authoritative development standards for CloudBSD applications. It defines mandatory guidelines for all CloudBSD projects covering programming languages, configuration management, testing, UI development, and internationalization.

## Directory Tree

```
application_guidelines/
├── AGENTS_START_HERE.md              # Primary agent entry point
├── INIT_PROMPT.md                    # Mandatory AI session prompt
├── LICENSE                           # BSD 3-Clause
├── README.md                         # Project overview & documentation index
├── test_md.sh                        # Markdown sanity check script
│
├── .idea/                            # IntelliJ IDEA configuration
│   ├── .gitignore
│   ├── application_guidelines.iml
│   ├── go.imports.xml
│   ├── modules.xml
│   └── vcs.xml
│
├── Configuration Files/              # Configuration management standards
│   └── CONFIGURATION.md
│
├── Internationalization/             # i18n requirements
│   └── INTERNATIONALIZATION.md
│
├── Languages/                        # Programming language selection criteria
│   └── LANGUAGES.md
│
├── Planning/                         # Project planning standards (.plan/ directory)
│   ├── PLANNING.md                   # Main planning standard
│   └── chapters/                     # Planning chapter documents
│       ├── 0001-Planning-Directory-Layout.md
│       ├── 0002-Planning-Document-Naming.md
│       ├── 0003-Planning-Document-Structure.md
│       ├── 0004-Planning-Task-Tables.md
│       ├── 0005-Planning-Agent-Entry-Point.md
│       ├── 0006-Planning-Maintenance.md
│       ├── 0007-Planning-Example-Layout.md
│       ├── 0008-Planning-Conventions.md
│       ├── 0009-Planning-References.md
│       └── 0010-Planning-ChangeLog.md
│
├── SKILLS/                           # AI agent skills (41 skill files)
│   ├── README.md                     # Skills index & dependency graph
│   ├── agents-sdk.md
│   ├── agents-start-here-generator.md
│   ├── api-analyzer.md
│   ├── ascii-diagrammer.md
│   ├── bhyve-manager.md
│   ├── build-status-updater.md
│   ├── cloudflare.md
│   ├── code-quality-analyzer.md
│   ├── codebase-mapper.md
│   ├── effect.md
│   ├── feature-task-generator.md
│   ├── file-system-analyzer.md
│   ├── github-triage.md
│   ├── jail-manager.md
│   ├── linuxulator-runner.md
│   ├── message-queue-analyzer.md
│   ├── network-stack-analyzer.md
│   ├── plan-document-generator.md
│   ├── plan-validator.md
│   ├── pre-publish-review.md
│   ├── privilege-analyzer.md
│   ├── process-model-analyzer.md
│   ├── progress-tracker-updater.md
│   ├── quick-reference-generator.md
│   ├── rc-script-writer.md
│   ├── reverse-engineer-for-port.md
│   ├── risk-assessor.md
│   ├── security-document-generator.md
│   ├── service-manager.md
│   ├── source-analysis-orchestrator.md
│   ├── sysctl-documenter.md
│   ├── system-call-analyzer.md
│   ├── task-workflow.md
│   ├── test-planner.md
│   ├── toc-generator.md
│   ├── ui-ux-analyzer.md
│   ├── validation-document-generator.md
│   ├── work-with-pr.md
│   └── zfs-manager.md
│
├── TUI/                              # Terminal UI guidelines
│   └── TUI.md
│
├── Testing Infrastructure/           # bhyve/jail testing standards
│   └── TESTING_INFRASTRUCTURE.md
│
├── Unit Testing/                    # Unit testing standards
│   └── UNITTESTS.md
│
└── Web User Interfaces/             # Web UI guidelines
    └── WEBUI.md
```

## Documentation Index

### Core Standards

| Document | Purpose |
|----------|---------|
| `Languages/LANGUAGES.md` | Programming language selection criteria |
| `Configuration Files/CONFIGURATION.md` | Configuration management, XDG Base Directory |
| `Internationalization/INTERNATIONALIZATION.md` | i18n requirements, UTF-8 encoding |
| `Unit Testing/UNITTESTS.md` | Testing philosophy, coverage targets |
| `Testing Infrastructure/TESTING_INFRASTRUCTURE.md` | bhyve VM and jail testing |
| `Planning/PLANNING.md` | `.plan/` directory standard |

### User Interfaces

| Document | Purpose |
|----------|---------|
| `TUI/TUI.md` | Terminal UI design guidelines |
| `Web User Interfaces/WEBUI.md` | Web frontend standards |

### AI & Automation

| Document | Purpose |
|----------|---------|
| `AGENTS_START_HERE.md` | Primary entry point for autonomous agents |
| `INIT_PROMPT.md` | Mandatory system prompt for AI sessions |
| `SKILLS/README.md` | Complete skill index with dependency graph |

## Key Principles

1. **Standards as Law** — All guidelines are mandatory, not suggestions
2. **Target Platform: FreeBSD** — CloudBSD is built on FreeBSD
3. **Security First** — Least privilege, input validation, encrypted secrets
4. **Test-Driven Development** — 80%+ coverage (100% for critical paths)
5. **Host Safety** — Kernel modules must never be loaded on development host
6. **UTF-8 Everywhere** — Internationalization requirement
7. **Mermaid Diagrams** — Preferred for all architecture diagrams

## Skills Overview

The repository contains **41 AI skills** organized into categories:

### Project Initialization
- `plan-document-generator`, `toc-generator`, `agents-start-here-generator`

### Task Management
- `task-workflow`

### Technical Documentation
- `sysctl-documenter`, `ascii-diagrammer`, `test-planner`, `risk-assessor`

### Quality Assurance
- `plan-validator`

### Code Porting
- `reverse-engineer-for-port`, `feature-task-generator`, `code-quality-analyzer`
- `ui-ux-analyzer`, `api-analyzer`, `message-queue-analyzer`

### OS Analysis
- `system-call-analyzer`, `process-model-analyzer`, `network-stack-analyzer`
- `file-system-analyzer`, `privilege-analyzer`

### FreeBSD System Administration
- `bhyve-manager`, `jail-manager`, `zfs-manager`, `linuxulator-runner`
- `rc-script-writer`, `service-manager`

### Development Workflow
- `codebase-mapper`, `effect`, `github-triage`, `pre-publish-review`, `work-with-pr`

### Cloudflare Platform
- `cloudflare`, `agents-sdk`

## Planning Chapters (10 documents)

1. `0001-Planning-Directory-Layout.md` — `.plan/` directory structure
2. `0002-Planning-Document-Naming.md` — Document naming conventions
3. `0003-Planning-Document-Structure.md` — Document template structure
4. `0004-Planning-Task-Tables.md` — Task tracking tables
5. `0005-Planning-Agent-Entry-Point.md` — Agent entry point generation
6. `0006-Planning-Maintenance.md` — Plan maintenance procedures
7. `0007-Planning-Example-Layout.md` — Example `.plan/` layout
8. `0008-Planning-Conventions.md` — Coding and formatting conventions
9. `0009-Planning-References.md` — Reference materials
10. `0010-Planning-ChangeLog.md` — Changelog format

## File Statistics

- **Total Files:** ~55 documents
- **Markdown Files:** ~54
- **Shell Script:** 1 (`test_md.sh`)
- **Languages:** Shell (100% by line count)
- **Commits:** 33

## Related Documents

- [SKILLS/README.md](SKILLS/README.md) — Complete skill index with invocation format
- [AGENTS_START_HERE.md](AGENTS_START_HERE.md) — Agent workflow summary
- [INIT_PROMPT.md](INIT_PROMPT.md) — Mandatory AI session configuration