# contrib/libyaml/ — LibYAML Codebase Map

**Path:** `contrib/libyaml/`
**Purpose:** YAML parser

## Overview

LibYAML provides a YAML parser.

## Key Files

| File | Purpose |
|------|---------|
| `yaml/` | Source |

## Key Functions

```c
int yaml_parser_initialize(yaml_parser_t *);
void yaml_parser_delete(yaml_parser_t *);
int yaml_parser_load(yaml_parser_t *, yaml_document_t *);
int yaml_document_get_node(yaml_document_t *, int);
```

## See Also

- `lib/libyaml/` - Installed