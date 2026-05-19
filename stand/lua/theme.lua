--
-- SPDX-License-Identifier: BSD-2-Clause
--
-- Copyright (c) 2024 FreeBSD Foundation
--
-- This module provides theming support for the FreeBSD boot loader.
-- Themes allow customization of the boot menu's appearance including
-- graphical elements, colors, and text strings for internationalization.
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

local theme = {}

local current_theme = nil
local theme_defaults = nil

local function deep_copy(orig)
	if type(orig) ~= "table" then
		return orig
	end
	local copy = {}
	for k, v in pairs(orig) do
		copy[k] = deep_copy(v)
	end
	return copy
end

local function get_path(name)
	if name == nil or name == "" then
		return nil
	end

	local paths = {}

	if name:match("^/") then
		table.insert(paths, name)
		if not name:match("%.lua$") then
			table.insert(paths, name .. ".lua")
		end
		return paths
	end

	if name:match("/") then
		table.insert(paths, "/boot/" .. name)
		if not name:match("%.lua$") then
			table.insert(paths, "/boot/" .. name .. ".lua")
		end
		return paths
	end

	table.insert(paths, "/boot/themes/" .. name .. "/theme.lua")
	table.insert(paths, "/boot/themes/" .. name)

	return paths
end

local function try_include_theme(path)
	if path == nil then
		return nil
	end
	local result = try_include(path)
	if result ~= nil then
		return result
	end
	return nil
end

function theme.load(name)
	local paths = get_path(name)
	if paths == nil then
		return nil, "Invalid theme name"
	end

	for _, path in ipairs(paths) do
		local result = try_include_theme(path)
		if result ~= nil and type(result) == "table" then
			current_theme = result
			return current_theme
		end
	end

	return nil, "Theme not found: " .. name
end

function theme.get(key, default)
	if current_theme == nil then
		return default
	end

	if key == nil then
		return current_theme
	end

	local parts = {}
	for part in string.gmatch(key, "[^.]+") do
		table.insert(parts, part)
	end

	local value = current_theme
	for _, part in ipairs(parts) do
		if type(value) ~= "table" then
			return default
		end
		value = value[part]
		if value == nil then
			return default
		end
	end

	return value
end

function theme.get_fallback(key, fallback)
	local value = theme.get(key)
	if value == nil then
		return fallback
	end
	return value
end

function theme.apply_defaults()
	if current_theme == nil then
		return
	end

	if theme_defaults == nil then
		local ok, result = theme.load("original")
		if ok then
			theme_defaults = result
		end
	end

	if theme_defaults == nil then
		return
	end

	local function apply_recursive(target, defaults, path)
		for k, v in pairs(defaults) do
			local full_path = path .. "." .. k
			if type(v) == "table" then
				if target[k] == nil then
					target[k] = deep_copy(v)
				elseif type(target[k]) == "table" then
					apply_recursive(target[k], v, full_path)
				end
			end
		end
	end

	apply_recursive(current_theme, theme_defaults, "theme")
end

function theme.validate()
	if current_theme == nil then
		return false, "No theme loaded"
	end

	if current_theme.version == nil then
		return false, "Theme missing version field"
	end

	if type(current_theme.version) ~= "number" then
		return false, "Theme version must be a number"
	end

	return true
end

function theme.get_current()
	return current_theme
end

function theme.is_loaded()
	return current_theme ~= nil
end

function theme.is_graphical_enabled()
	if not theme.is_loaded() then
		return false
	end
	local btn = theme.get("graphical.button.enabled")
	if btn ~= nil then
		return btn
	end
	return theme.get("graphical.enabled", false)
end

function theme.get_text(key, default)
	local str = theme.get("text.strings." .. key)
	if str ~= nil then
		return str
	end
	return default
end

return theme
