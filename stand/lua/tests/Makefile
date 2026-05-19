# SPDX-License-Identifier: BSD-2-Clause
#-
# Copyright (c) 2024 FreeBSD Foundation
#
# Unit tests for the boot loader theme system
#
# To run these tests on FreeBSD:
# 1. Ensure lua5.4 or lua is installed: pkg install lua54
# 2. Run: lua5.4 tests/test_theme.lua
#        lua5.4 tests/test_themes.lua
#
# Or run all tests via make:
#  cd stand/lua
#  make test
#
# Note: Some tests mock loader-specific functions (try_include, loader.getenv)
# to allow standalone testing without the full loader environment.

TESTS=	test_theme.lua \
	test_themes.lua

LUA=	lua5.4

test:
	@echo "Running theme system unit tests..."
	@for test in $(TESTS); do \
		echo ""; \
		echo "=== Running $$test ==="; \
		cd tests && $(LUA) $$test || exit 1; \
		cd ..; \
	done
	@echo ""
	@echo "All tests passed!"

.PHONY: test