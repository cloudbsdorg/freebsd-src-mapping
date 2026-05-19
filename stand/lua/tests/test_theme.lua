--
-- SPDX-License-Identifier: BSD-2-Clause
--
-- Copyright (c) 2024 FreeBSD Foundation
--
-- Unit tests for the theme module.
-- These tests verify the pure Lua theme logic independent of loader.
--
-- Run with: lua5.3 test_theme.lua
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

-- Mock loader-specific functions that the theme module depends on
_G.try_include = function(name)
	-- Return mock themes based on name
	if name == "/boot/theme" then
		return {
			name = "Test Theme",
			version = 1,
			graphical = { enabled = true }
		}
	elseif name == "/boot/themes/original/theme.lua" then
		return {
			name = "Original",
			version = 1,
			text = { strings = { menu_title = "Default Title" } }
		}
	elseif name == "/boot/themes/default/theme.lua" then
		return {
			name = "Default",
			version = 1,
			graphical = { enabled = true }
		}
	end
	return nil
end

_G.loader = {
	getenv = function(var)
		return nil
	end
}

-- Load the theme module (it uses try_include and loader.getenv)
package.path = package.path .. ";"
dofile("theme.lua")

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

local function assert_nil(v, msg)
	if v == nil then
		tests_passed = tests_passed + 1
		print("PASS: " .. msg)
	else
		tests_failed = tests_failed + 1
		print("FAIL: " .. msg .. " (expected nil, got " .. tostring(v) .. ")")
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

print("=== Theme Module Unit Tests ===\n")

-- Test theme.load with nil
print("--- Testing theme.load ---")
local ok, err = theme.load(nil)
assert_nil(ok, "theme.load(nil) returns nil")

-- Test theme.load with invalid/empty name
ok, err = theme.load("")
assert_nil(ok, "theme.load('') returns nil")

-- Test loading a valid theme
print("\n--- Testing theme.load with valid theme ---")
ok = theme.load("/boot/theme")
assert_not_nil(ok, "theme.load('/boot/theme') returns theme table")
assert_eq(theme.is_loaded(), true, "is_loaded returns true after loading")

-- Test theme.get with loaded theme
print("\n--- Testing theme.get with loaded theme ---")
assert_eq(theme.get("name"), "Test Theme", "get('name') returns theme name")
assert_eq(theme.get("graphical.enabled"), true, "get('graphical.enabled') returns true")
assert_eq(theme.get("nonexistent", "default"), "default", "get returns default for missing key")

-- Test dot notation key parsing
print("\n--- Testing dot notation key parsing ---")
assert_eq(theme.get("graphical.enabled"), true, "dot notation works for nested keys")

-- Test theme.validate
print("\n--- Testing theme.validate ---")
local valid, err = theme.validate()
assert_eq(valid, true, "validate returns true for valid theme")

-- Test theme.is_graphical_enabled
print("\n--- Testing theme.is_graphical_enabled ---")
assert_eq(theme.is_graphical_enabled(), true, "is_graphical_enabled returns true when graphical.enabled = true")

-- Test theme.get_text
print("\n--- Testing theme.get_text ---")
-- First load a theme with text strings
theme.load("/boot/themes/original/theme.lua")
assert_eq(theme.get_text("menu_title", "Fallback"), "Default Title", "get_text returns theme string")

-- Test theme.get_current
print("\n--- Testing theme.get_current ---")
assert_not_nil(theme.get_current(), "get_current returns theme table")
assert_eq(theme.get_current().name, "Original", "get_current returns correct theme")

-- Test theme.apply_defaults
print("\n--- Testing theme.apply_defaults ---")
-- Load original which should have defaults
theme.load("/boot/themes/original/theme.lua")
theme.apply_defaults()
-- After apply_defaults, theme should still be valid
valid = theme.validate()
assert_eq(valid, true, "apply_defaults keeps theme valid")

print("\n=== Summary ===")
print("Passed: " .. tests_passed)
print("Failed: " .. tests_failed)

if tests_failed > 0 then
	os.exit(1)
end