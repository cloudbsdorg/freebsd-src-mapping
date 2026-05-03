# contrib/nvi/ — New Vi Editor Codebase Map

**Path:** `contrib/nvi/`
**Purpose:** New Vi editor

## Overview

nvi is a re-implementation of the vi editor.

## Key Files

| File | Purpose |
|------|---------|
| `ex/` | Ex commands |
| `vi/` | Vi commands |
| `common/` | Common |
| `db/` | Database |
| `regexp/` | Regex |
| `edit/` | Editing |

## Vi Modes

| Mode | Purpose |
|------|---------|
| Command | Normal |
| Insert | Text input |
| Colon | Ex commands |
| Visual | Selection |

## Ex Commands

| Command | Purpose |
|---------|---------|
| `:w` | Write |
| `:q` | Quit |
| `:q!` | Force quit |
| `:e` | Edit file |
| `:s` | Substitute |
| `:set` | Set options |

## See Also

- `usr.bin/vi/` - Installed binary