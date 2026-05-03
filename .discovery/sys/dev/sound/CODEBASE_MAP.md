# sys/dev/sound/ — Sound Driver Codebase Map

**Path:** `sys/dev/sound/`
**Purpose:** Audio subsystem

## Overview

The sound driver provides the audio subsystem.

## Key Files

| File | Purpose |
|------|---------|
| `sound.c` | Core |
| `channel.c` | Channel |
| `pcm_channel.c` | PCM channel |
| `pcm_ioctl.c` | IOCTL |

## Subdirectories

| Directory | Purpose |
|-----------|---------|
| `hdac/` | HD Audio |
| `ich/` | Intel ICH |
| `emu/` | EMU10K1 |
| `uaudio/` | USB audio |

## See Also

- `sys/dev/sound/` - Sound devices