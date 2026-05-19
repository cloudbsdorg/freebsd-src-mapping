# FreeBSD Boot Loader Theme System - Implementation Plan

## Overview

Add a theming system to the FreeBSD boot loader that supports:
- Graphical mode with PNG backgrounds and graphical buttons
- Text mode internationalization via externalized strings
- Appliance branding with custom logos and text
- Full backward compatibility (original behavior preserved as default theme)

---

## Theme File Discovery

```
/boot/
  theme              # Simple single-file theme (fallback/default)
  themes/
    original/         # Built-in original FreeBSD behavior
      theme.lua
    default/         # Built-in default graphical theme
      theme.lua
    myappliance/     # Custom theme example
      theme.lua
      images/        # Theme-specific assets
```

- `loader_theme="myappliance"` in loader.conf selects `/boot/themes/myappliance/`
- If theme not found, falls back to `/boot/theme`, then `themes/default/`
- If nothing found, uses built-in original behavior

---

## Image Format Support

**PNG only** for theme backgrounds:
- Boot loader has pnglite library built-in
- Must be PNG_TRUECOLOR_ALPHA (32-bit RGBA with alpha channel)
- No palette/indexed PNGs, no RGB without alpha
- Users must export as "32-bit PNG" or "RGBA" from graphics tools

---

## Theme File Format

```lua
return {
    name = "Theme Name",
    version = 1,

    graphical = {
        background = {
            type = "solid",  -- or "gradient" or "image"
            color = 0xRRGGBB,
            -- For gradient:
            colors = { 0xRRGGBB, 0xRRGGBB },  -- top, bottom
            -- For image:
            image = "/boot/images/bg.png",  -- PNG only, TRUECOLOR_ALPHA
            image_mode = "fill",  -- fill|fit|center
        },

        button = {
            style = "rounded",  -- or "sharp"
            corner_radius = 12,
            normal = {
                bg = 0xRRGGBB,
                fg = 0xRRGGBB,
                border = 0xRRGGBB,
                border_width = 2,
            },
            selected = {
                bg = 0xRRGGBB,
                fg = 0xRRGGBB,
                border = 0xRRGGBB,
                border_width = 3,
            },
        },

        selection = {
            show_arrow = true,
            arrow = "▶",  -- or ">>"
            arrow_gap = 8,
        },
    },

    text = {
        strings = {
            menu_title = "Welcome to FreeBSD",
            boot_multi = "Boot Multi user",
            boot_single = "Boot Single user",
            -- All menu strings...
        },
        ascii_logos = {
            beastie = nil,  -- use default
            -- or custom path
        },
    },

    common = {
        logo = nil,  -- nil = use default
        brand_text = nil,  -- nil = use "FreeBSD"
    },
}
```

---

## New Files to Create

### 1. Theme Files

**`stand/lua/themes/original/theme.lua`** - Built-in text-only fallback
```lua
return {
    name = "Original FreeBSD",
    version = 1,
    text = {
        strings = {
            -- All menu strings in English
            boot_multi = "Boot Multi user",
            boot_single = "Boot Single user",
            -- etc.
        },
        ascii_logos = {
            beastie = "logo-beastie.4th",  -- Reference to forth file
            orb = "logo-orb.4th",
        },
    },
}
```

**`stand/lua/themes/default/theme.lua`** - Graphical buttons default
```lua
return {
    name = "Default Graphical",
    version = 1,
    graphical = {
        background = {
            type = "solid",
            color = 0x1a1a2e,
        },
        button = {
            style = "rounded",
            corner_radius = 12,
            -- colors, etc.
        },
    },
    text = {
        strings = { /* English strings */ },
    },
}
```

### 2. Theme Loader Module

**`stand/lua/theme.lua`** (new ~200 lines)
- `theme.load(name)` - Load theme by name or path
- `theme.get(key)` - Get theme value with dot notation ("graphical.button.corner_radius")
- `theme.get_fallback(key, default)` - Get with fallback for boot safety
- `theme.validate()` - Validate theme has required fields
- `theme.apply_defaults()` - Fill missing fields from original theme

### 3. Theme Registry

**`stand/lua/themes.lua`** (new ~100 lines)
- Maps built-in theme names to their paths
- Handles fallback logic

### 4. Image Loading Extension

**`stand/common/gfx_fb.c`** (modify)
- Add `gfx_fb_drawroundedrect()` using Bézier curves for corners
- May need to add PNG loading for background images in loader context

---

## Files to Modify

### `stand/lua/drawer.lua`
- Add `drawButton()` function for graphical buttons
- Add `drawBackground()` function for theme backgrounds
- Modify `drawmenu()` to use buttons when in graphical mode
- Add theme-aware string lookup for i18n

### `stand/lua/menu.lua`
- Add arrow key escape sequence detection
- Add selection index tracking
- Modify `menu.process()` for up/down arrow navigation
- Add Enter key handling for button activation

### `stand/lua/core.lua`
- Add `core.KEYSTR_UP = "\027[A"`
- Add `core.KEYSTR_DOWN = "\027[B"`
- Add `core.KEY_ENTER = 13` (already exists)

### `stand/lua/screen.lua`
- Add `screen.setfg(color)` and `screen.setbg(color)` for graphics mode
- Add `screen.getwidth()` and `screen.getheight()` for resolution info

### `stand/lua/color.lua`
- Add color parsing from hex (0xRRGGBB format)

### `stand/defaults/loader.conf`
- Add theme-related variables:
```
loader_theme=""           # Theme name (empty = auto/fallback)
loader_menu_buttons="yes" # Enable graphical buttons (for default theme)
```

---

## Implementation Phases

### Phase 1: Theme Infrastructure (Foundation)
1. Create `stand/lua/themes/` directory structure
2. Create `stand/lua/theme.lua` - theme loading and validation
3. Create `stand/lua/themes/original/theme.lua` - fallback text-only
4. Modify `stand/lua/drawer.lua` to use `theme.get()` for configuration
5. Verify original behavior unchanged

### Phase 2: Text Mode i18n Support
1. Externalize all menu strings in `stand/lua/themes/original/theme.lua`
2. Add string lookup in `stand/lua/drawer.lua`
3. Create `stand/lua/themes/default/theme.lua` with English strings
4. Test text mode with custom strings

### Phase 3: Graphical Button Drawing (C Code)
1. Implement `gfx_fb_drawroundedrect()` in `stand/common/gfx_fb.c`
2. Export to Lua via `stand/liblua/gfx_utils.c`
3. Create `drawButton()` in `stand/lua/drawer.lua`
4. Add button state tracking

### Phase 4: Selection Navigation
1. Add arrow key constants to `stand/lua/core.lua`
2. Implement escape sequence detection in `stand/lua/menu.lua`
3. Add selection index tracking
4. Wire up button highlighting to selection state
5. Add button press animation

### Phase 5: Background Support
1. Add PNG loading for background images (reuse pnglite)
2. Implement `drawBackground()` in `stand/lua/drawer.lua`
3. Add background configuration to theme
4. Support fill/fit/center modes

### Phase 6: Default Graphical Theme
1. Create `stand/lua/themes/default/theme.lua` with nice defaults
2. Polish button styling
3. Add selection indicator (arrow)
4. Document theme creation

### Phase 7: Testing & Polish
1. Test on QEMU with UEFI
2. Test on real hardware
3. Test fallback behavior (missing theme, bad theme)
4. Document theme API

---

## Testing on FreeBSD

```bash
# Clone source
git clone https://git.freebsd.org/src.git /usr/src

# Build just the boot loader
cd /usr/src/stand
make -j$(sysctl -n hw.ncpu)

# Install to running system (backup first)
cp /boot/loader.efi /boot/loader.efi.bak
make install

# Or manually copy
cp obj/*.efi /boot/loader.efi

# Reboot to test
reboot
```

For QEMU with UEFI on macOS:
```bash
brew install qemu

qemu-system-x86_64 \
  -m 2G \
  -bios /usr/share/OVMF/OVMF.fd \
  -cdrom FreeBSD-*.iso \
  -hda disk.img
```

---

## Key Design Decisions

| Decision | Choice |
|----------|--------|
| Theme format | Lua tables (native, no overhead) |
| Image format | PNG TRUECOLOR_ALPHA only (existing pnglite limitation) |
| Validation | Strict with fallback to defaults (boot-safe) |
| Text mode changes | Only string externalization (i18n) |
| Selection navigation | Wrap around |
| Button press feedback | Brief visual state change |
| Theme discovery | `/boot/theme` or `/boot/themes/<name>/` with fallback |