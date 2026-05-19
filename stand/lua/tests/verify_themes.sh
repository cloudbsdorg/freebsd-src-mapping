#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (c) 2024 FreeBSD Foundation
#
# Verification test for theme files.
# This script checks that theme files have valid structure.
#
# Run: ./verify_themes.sh

set -e

echo "=== Verifying Theme Files ==="
echo ""

# Check original theme exists and has required fields
echo "Checking themes/original/theme.lua..."
if [ ! -f "themes/original/theme.lua" ]; then
    echo "ERROR: themes/original/theme.lua not found"
    exit 1
fi

# Verify it returns a table with required fields
if ! grep -q "return {" themes/original/theme.lua; then
    echo "ERROR: themes/original/theme.lua does not return a table"
    exit 1
fi

if ! grep -q 'name = "Original' themes/original/theme.lua; then
    echo "ERROR: themes/original/theme.lua missing name field"
    exit 1
fi

if ! grep -q "version = 1" themes/original/theme.lua; then
    echo "ERROR: themes/original/theme.lua missing version field"
    exit 1
fi

echo "  OK: original theme has required fields"

# Check default theme
echo ""
echo "Checking themes/default/theme.lua..."
if [ ! -f "themes/default/theme.lua" ]; then
    echo "ERROR: themes/default/theme.lua not found"
    exit 1
fi

if ! grep -q 'name = "Default' themes/default/theme.lua; then
    echo "ERROR: themes/default/theme.lua missing name field"
    exit 1
fi

if ! grep -q "version = 1" themes/default/theme.lua; then
    echo "ERROR: themes/default/theme.lua missing version field"
    exit 1
fi

echo "  OK: default theme has required fields"

# Verify graphical section exists in default theme
if ! grep -q "graphical" themes/default/theme.lua; then
    echo "ERROR: default theme missing graphical section"
    exit 1
fi

echo "  OK: default theme has graphical section"

# Check theme.lua module
echo ""
echo "Checking theme.lua module..."
if [ ! -f "theme.lua" ]; then
    echo "ERROR: theme.lua not found"
    exit 1
fi

# Check it exports required functions
for func in "function theme.load" "function theme.get" "function theme.validate" "function theme.is_graphical_enabled"; do
    if ! grep -q "$func" theme.lua; then
        echo "ERROR: theme.lua missing $func"
        exit 1
    fi
done

echo "  OK: theme.lua has required functions"

# Check themes.lua module
echo ""
echo "Checking themes.lua module..."
if [ ! -f "themes.lua" ]; then
    echo "ERROR: themes.lua not found"
    exit 1
fi

for func in "function themes.load" "function themes.cycle_next" "function themes.init"; do
    if ! grep -q "$func" themes.lua; then
        echo "ERROR: themes.lua missing $func"
        exit 1
    fi
done

echo "  OK: themes.lua has required functions"

# Check drawer.lua has button drawing function
echo ""
echo "Checking drawer.lua has button support..."
if ! grep -q "function drawer.drawButton" drawer.lua; then
    echo "ERROR: drawer.lua missing drawButton function"
    exit 1
fi

if ! grep -q "fb_drawroundedrect" drawer.lua; then
    echo "ERROR: drawer.lua does not use fb_drawroundedrect"
    exit 1
fi

echo "  OK: drawer.lua has button support"

# Check gfx_fb.h has rounded rect declaration
echo ""
echo "Checking gfx_fb.h for rounded rect declaration..."
if ! grep -q "gfx_fb_drawroundedrect" ../common/gfx_fb.h; then
    echo "ERROR: gfx_fb.h missing gfx_fb_drawroundedrect declaration"
    exit 1
fi

echo "  OK: gfx_fb.h has rounded rect declaration"

echo ""
echo "=== All Theme File Verifications Passed ==="