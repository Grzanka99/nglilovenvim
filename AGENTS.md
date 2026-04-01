# AGENTS.md — Neovim Configuration

This is a Neovim configuration written in Lua, using **lazy.nvim** as the plugin manager.

## Style

- 2-space indentation, double quotes, no semicolons
- Always use parentheses on function calls: `require("foo")` not `require "foo"`
- Use `vim.opt` for options, `vim.keymap.set` for keymaps (always include `desc`)
- Use `vim.notify` for user-facing messages, not `print`
