--
-- SPDX-License-Identifier: BSD-2-Clause
--
-- Copyright (c) 2024 FreeBSD Foundation
--
-- This is the original FreeBSD theme, preserving existing behavior.
-- It provides text-only menu display with all FreeBSD default strings.
--
-- This theme serves as the fallback when no other theme is found.
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

return {
	name = "Original FreeBSD",
	version = 1,

	graphical = {
		enabled = false,
		button = {
			enabled = false,
			style = "sharp",
			corner_radius = 0,
			normal = {
				bg = 0x333333,
				fg = 0xFFFFFF,
				border = 0x555555,
				border_width = 2,
			},
			selected = {
				bg = 0x0066CC,
				fg = 0xFFFFFF,
				border = 0x00AAFF,
				border_width = 3,
			},
		},
		selection = {
			show_arrow = false,
			arrow = "▶",
			arrow_gap = 8,
		},
		background = {
			type = "solid",
			color = 0x000000,
		},
	},

	text = {
		strings = {
			menu_title = "Welcome to FreeBSD",

			boot_multi = "Boot Multi user",
			boot_single = "Boot Single user",

			escape_prompt = "Escape to loader prompt",

			reboot = "Reboot",

			console = "Console",

			boot_options = "Boot Options",

			acpi = "ACPI",
			safe_mode = "Safe Mode",
			single_user = "Single user",
			verbose = "Verbose",

			kernel = "Kernel",

			boot_environments = "Boot Environments",
			bootfs = "Bootfs",
			rewind_checkpoint = "Rewind ZFS Checkpoint",

			chainload = "Chainload",

			load_defaults = "Load System Defaults",

			back_to_main_menu = "Back to main menu",

			autoboot_prompt = "Autoboot in %d seconds. [Space] to pause",

			on = "On",
			off = "off",
		},

		ascii_logos = {
			beastie = "logo-beastie.4th",
			beastiebw = "logo-beastiebw.4th",
			orb = "logo-orb.4th",
			orbbw = "logo-orbbw.4th",
			fbsdbw = "logo-fbsdbw.4th",
		},

		frame = {
			style = "double",
			title_align = "center",
		},

		item = {
			selected_style = "bold",
		},

		selection = {
			show_number = true,
		},
	},

	common = {
		logo = nil,
		brand_text = nil,
		menu_position = nil,
	},
}
