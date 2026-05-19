--
-- SPDX-License-Identifier: BSD-2-Clause
--
-- Copyright (c) 2024 FreeBSD Foundation
--
-- This module provides theme registry and discovery for the FreeBSD
-- boot loader. It handles finding themes and falling back to defaults.
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

local theme = require("theme")

local themes = {}

local builtin_themes = {
	["original"] = true,
	["default"] = true,
}

local current_theme_name = nil
local theme_cycle_list = nil

local function build_cycle_list()
	local list = {}
	for k, _ in pairs(builtin_themes) do
		table.insert(list, k)
	end
	return list
end

local function init()
	theme_cycle_list = build_cycle_list()
end

local function load_theme(name)
	if name == nil or name == "" then
		local env_theme = loader.getenv("loader_theme")
		if env_theme ~= nil and env_theme ~= "" then
			name = env_theme
		else
			local ok, err = theme.load("/boot/theme")
			if ok then
				current_theme_name = name
				return ok
			end
			name = "default"
		end
	end

	local ok, err = theme.load(name)
	if ok then
		current_theme_name = name
		return ok
	end

	if builtin_themes[name] then
		return nil, err
	end

	ok, err = theme.load("/boot/theme")
	if ok then
		current_theme_name = "/boot/theme"
		return ok
	end

	ok, err = theme.load("default")
	if ok then
		current_theme_name = "default"
		return ok
	end

	ok, err = theme.load("original")
	if ok then
		current_theme_name = "original"
		return ok
	end

	return nil, "Failed to load any theme"
end

local function is_builtin(name)
	return builtin_themes[name] == true
end

function themes.load(name)
	return load_theme(name)
end

function themes.is_builtin(name)
	return is_builtin(name)
end

function themes.get_builtin_list()
	return build_cycle_list()
end

function themes.get_current_name()
	return current_theme_name
end

function themes.set_current_name(name)
	current_theme_name = name
end

function themes.cycle_next()
	if theme_cycle_list == nil or #theme_cycle_list == 0 then
		return nil
	end

	local current_idx = 0
	for i, name in ipairs(theme_cycle_list) do
		if name == current_theme_name then
			current_idx = i
			break
		end
	end

	local next_idx = (current_idx % #theme_cycle_list) + 1
	local next_name = theme_cycle_list[next_idx]

	local ok, err = theme.load(next_name)
	if ok then
		current_theme_name = next_name
		return next_name
	end

	return nil
end

function themes.init()
	return init()
end

return themes
