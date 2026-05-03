# Planning Chapters — Codebase Map

**Source:** https://github.com/cloudbsdorg/application_guidelines/tree/main/Planning/chapters
**Total Chapters:** 10

## Overview

The Planning chapters provide detailed specifications for the `.plan/` directory standard used across all CloudBSD projects. These documents define how to structure project planning, document naming, task tracking, and maintenance procedures.

## Chapter Documents

### 0001-Planning-Directory-Layout.md

**Purpose:** Define the `.plan/` directory structure.

**Key Topics:**
- Required directories and files
- Directory naming conventions
- File organization
- Minimal viable `.plan/` structure
- Extended structure options

---

### 0002-Planning-Document-Naming.md

**Purpose:** Document naming conventions.

**Key Topics:**
- Numbering scheme (0001-, 0100-, 0200-, etc.)
- Category prefixes
- File extension requirements
- Version handling
- Draft vs final naming

---

### 0003-Planning-Document-Structure.md

**Purpose:** Document template structure.

**Key Topics:**
- Required sections (Purpose, Background, Tasks, etc.)
- Optional sections
- Section ordering
- Markdown formatting requirements
- Header level conventions

---

### 0004-Planning-Task-Tables.md

**Purpose:** Task tracking table format.

**Key Topics:**
- Task table columns
- Status values
- Priority levels
- Assignee conventions
- Progress tracking
- Dependencies

---

### 0005-Planning-Agent-Entry-Point.md

**Purpose:** Agent entry point document generation.

**Key Topics:**
- AGENTS_START_HERE.md structure
- Quick reference sections
- Skill loading instructions
- Workflow summaries
- Entry point generation process

---

### 0006-Planning-Maintenance.md

**Purpose:** Plan maintenance procedures.

**Key Topics:**
- When to update plans
- Change tracking
- Document archival
- Review cycles
- Stale plan handling

---

### 0007-Planning-Example-Layout.md

**Purpose:** Example `.plan/` directory layouts.

**Key Topics:**
- Minimal example
- Standard project example
- Large project example
- Multi-agent project example
- Template references

---

### 0008-Planning-Conventions.md

**Purpose:** Coding and formatting conventions.

**Key Topics:**
- Markdown style guide
- Code block conventions
- Diagram conventions (Mermaid required)
- Link formatting
- List formatting
- Table formatting

---

### 0009-Planning-References.md

**Purpose:** Reference materials.

**Key Topics:**
- External references
- Internal references
- Link validation
- Citation format
- Bibliography structure

---

### 0010-Planning-ChangeLog.md

**Purpose:** Changelog format and procedures.

**Key Topics:**
- Changelog format (Keep a Changelog)
- Entry categories
- Version formatting
- Date formatting
- Change classification

## Document Relationship

```
0001-Planning-Directory-Layout.md
         │
         ▼
0002-Planning-Document-Naming.md
         │
         ▼
0003-Planning-Document-Structure.md
         │
         ▼
0004-Planning-Task-Tables.md
         │
         ▼
0005-Planning-Agent-Entry-Point.md
         │
         ▼
0006-Planning-Maintenance.md
         │
         ▼
0007-Planning-Example-Layout.md
         │
         ▼
0008-Planning-Conventions.md
         │
         ▼
0009-Planning-References.md
         │
         ▼
0010-Planning-ChangeLog.md
```

## Numbering Schema

| Range | Category |
|-------|----------|
| 0000-0099 | Project Management (TOC, overview, maintenance) |
| 0100-0199 | Requirements & Analysis |
| 0200-0299 | Architecture & Design |
| 0300-0399 | Implementation |
| 0400-0499 | Testing (unit, integration, system) |
| 0500-0599 | Configuration & Operations |
| 0600-0699 | Security |
| 0700-0799 | Risk Management |
| 0800-0899 | Deployment & Release |
| 0900-0999 | Post-Deployment |

## Related Documents

| Document | Path |
|----------|------|
| Main Planning Standard | `../PLANNING.md` |
| Task Workflow Skill | `../../SKILLS/task-workflow.md` |
| Plan Validator Skill | `../../SKILLS/plan-validator.md` |
| Plan Document Generator | `../../SKILLS/plan-document-generator.md` |
| TOC Generator | `../../SKILLS/toc-generator.md` |
| Agent Start Here Generator | `../../SKILLS/agents-start-here-generator.md` |

## Key Principles

1. **Consistency** — All projects use the same structure
2. **Discoverability** — Documents are findable by number prefix
3. **Maintainability** — Clear update and archival procedures
4. **Automation** — Skills support plan generation and validation
5. **Mermaid Diagrams** — Required for all architecture diagrams