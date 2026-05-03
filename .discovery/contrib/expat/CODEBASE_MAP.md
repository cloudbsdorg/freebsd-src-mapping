# contrib/expat/ — Expat XML Parser Codebase Map

**Path:** `contrib/expat/`
**Purpose:** XML parsing library

## Overview

Expat is an XML 1.0 parser written in C.

## Key Files

| File | Purpose |
|------|---------|
| `lib/xmlparse.c` | Parser |
| `lib/xmltok.c` | Tokenizer |
| `lib/xmlrole.c` | Role |
| `lib/xmlstring.c` | Strings |

## Key Functions

```c
XML_Parser XML_ParserCreate(const XML_Char *encoding);
void XML_ParserFree(XML_Parser parser);
int XML_Parse(XML_Parser parser, const char *s, int len, int isFinal);
void XML_SetElementHandler(XML_Parser, XML_StartElementHandler, XML_EndElementHandler);
void XML_SetCharacterDataHandler(XML_Parser, XML_CharacterDataHandler);
```

## See Also

- `lib/libexpat/` - Installed