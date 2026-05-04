# Codebase Map: sys/dev/sound

**Path:** `sys/dev/sound/`
**Type:** Directory
**Maps to:** `.discovery/sys/dev/sound/CODEBASE_MAP.md`

## Summary

FreeBSD audio subsystem. Supports various audio devices including AC97, HDA, USB audio, and software mixing.

## Subdirectories

| Directory | Purpose |
|-----------|---------|
| pcm/ | PCM audio core, mixer, channel management |
| usb/ | USB audio support |
| pci/ | PCI sound cards |
| isa/ | ISA sound cards |
| midi/ | MIDI support |
| fdt/ | Flattened Device Tree audio |
| macio/ | Mac I/O audio |

## Components (pcm/)

| File | Purpose |
|------|---------|
| sound.c | Sound core |
| pcm.h | PCM header |
| channel.c | Audio channel management |
| mixer.c | Audio mixer |
| feeder.c | Audio feeder chain |
| feeder_eq.c | Equalizer |
| feeder_format.c | Format conversion |
| feeder_mixer.c | Mixing |
| feeder_rate.c | Sample rate conversion |
| feeder_volume.c | Volume control |
| buffer.c | Audio buffer management |
| dsp.c | DSP functionality |
| vchan.c | Virtual channel support |

## Dependencies

- `sys/sound/` - Kernel audio headers
- `dev/usb/` - USB audio