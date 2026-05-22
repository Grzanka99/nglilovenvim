# nglilovenvim

Personal Neovim config written in Lua and managed with `lazy.nvim`.

## Features

- `lazy.nvim` plugin management with lockfile
- LSP setup with `mason.nvim` and `nvim-lspconfig`
- Completion with `blink.cmp`
- Treesitter syntax support
- `snacks.nvim` for picker, explorer, dashboard, rename, notifier, and more
- Project-specific plugin loading through `.nvim.lua` and `exrc`
- Auto-reload checks for files changed outside Neovim
- Per-project Neovim server socket support

## Requirements

- Neovim `0.12+`
- Git
- Cargo for building `blink.cmp`

## Install

Clone repo into Neovim config directory:

```sh
git clone git@github.com:Grzanka99/nglilovenvim.git ~/.config/nvim
```

Start Neovim:

```sh
nvim
```

`lazy.nvim` bootstraps itself on first launch.

## Project Config

This config enables `exrc` and loads `.nvim.lua` early.

Example:

```lua
vim.g.project_type = { "lua", "typescript", "vue" }
```

Supported project modules live under `lua/plugins/exrc/`.

## Notes

- Main leader key is `<Space>`
- Local changes in `lazy-lock.json` can update plugin versions over time

## License

MIT. See `LICENSE`.
