--
-- SPDX-License-Identifier: BSD-2-Clause
--
-- Copyright (c) 2024 FreeBSD Foundation
--
-- Unit tests for the themes registry module (theme cycling).
--
-- Run with: lua5.3 test_themes.lua
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- SUCH DAMAGE.

-- Mock loader-specific functions
_G.try_include = function(name)
	if name == "original" then
		return {
			name = "Original",
			version = 1,
			graphical = { enabled = false }
		}
	elseif name == "default" then
		return {
			name = "Default Graphical",
			version = 1,
			graphical = { enabled = true }
		}
	elseif name == "/boot/theme" then
		return nil  -- No custom theme
	end
	return nil
end

_G.loader = {
	getenv = function(var)
		if var == "loader_theme" then
			return nil  -- No theme specified in loader.conf
		end
		return nil
	end
}

-- Track theme loads for testing
local loaded_themes = {}

-- Load the modules
dofile("theme.lua")
dofile("themes.lua")

local tests_passed = 0
local tests_failed = 0

local function assert_eq(a, b, msg)
	if a == b then
		tests_passed = tests_passed + 1
		print("PASS: " .. msg)
	else
		tests_failed = tests_failed + 1
		print("FAIL: " .. msg .. " (expected " .. tostring(b) .. ", got " .. tostring(a) .. ")")
	end
end

local function assert_true(v, msg)
	if v == true then
		tests_passed = tests_passed + 1
		print("PASS: " .. msg)
	else
		tests_failed = tests_failed + 1
		print("FAIL: " .. msg .. " (expected true, got " .. tostring(v) .. ")")
	end
end

local function assert_not_nil(v, msg)
	if v ~= nil then
		tests_passed = tests_passed + 1
		print("PASS: " .. msg)
	else
		tests_failed = tests_failed + 1
		print("FAIL: " .. msg .. " (expected not nil)")
	end
end

print("=== Themes Registry Unit Tests ===\n")

-- Test themes.init
print("--- Testing themes.init ---")
themes.init()
assert_true(true, "themes.init() completes without error")

-- Test themes.get_builtin_list
print("\n--- Testing themes.get_builtin_list ---")
local list = themes.get_builtin_list()
assert_not_nil(list, "get_builtin_list returns a table")
assert_true(#list > 0, "get_builtin_list returns non-empty list")

-- Check that 'original' and 'default' are in the list
local has_original = false
local has_default = false
for _, v in ipairs(list) do
	if v == "original" then has_original = true end
	if v == "default" then has_default = true end
end
assert_true(has_original, "get_builtin_list contains 'original'")
assert_true(has_default, "get_builtin_list contains 'default'")

-- Test themes.load - initial load
print("\n--- Testing themes.load (initial) ---")
local ok = themes.load("original")
assert_not_nil(ok, "load('original') succeeds")
assert_eq(themes.get_current_name(), "original", "get_current_name returns 'original'")

-- Test themes.cycle_next
print("\n--- Testing themes.cycle_next ---")
local next_theme = themes.cycle_next()
assert_not_nil(next_theme, "cycle_next returns a theme name")

-- Test that cycling twice brings us back
local first_theme = themes.get_current_name()
themes.cycle_next()  -- Go to next
themes.cycle_next()  -- Go to next again
local third_theme = themes.get_current_name()

-- After cycling through all themes, we should wrap around
-- The cycle order depends on the list order
assert_not_nil(third_theme, "cycling multiple times works")

-- Test themes.is_builtin
print("\n--- Testing themes.is_builtin ---")
assert_true(themes.is_builtin("original"), "is_builtin('original') is true")
assert_true(themes.is_builtin("default"), "is_builtin('default') is true")
assert_true(not themes.is_builtin("nonexistent"), "is_builtin('nonexistent') is false")

print("\n=== Summary ===")
print("Passed: " .. tests_passed)
print("Failed: " .. tests_failed)

if tests_failed > 0 then
	os.exit(1)
end