-- Core
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.autoread = true

-- Files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Undo
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.cmd("set undodir=" .. undodir)
vim.opt.undofile = true

-- GUI Appearance
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.number = vim.g.__.gui.numberLines or false
vim.opt.relativenumber = vim.g.__.gui.relativeLineNumber or false

-- Split Windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Code Style
vim.opt.scrolloff = 8
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.tabstop = vim.g.__.codestyle.tab_size
vim.opt.softtabstop = vim.g.__.codestyle.tab_size
vim.opt.shiftwidth = vim.g.__.codestyle.tab_size
vim.opt.expandtab = vim.g.__.codestyle.expandtab

-- Input/Completion
vim.opt.mouse = "a"
vim.opt.timeoutlen = 750
vim.opt.completeopt = "menuone,noselect"
vim.opt.updatetime = 50

-- Search
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Terminal
vim.cmd("let g:nvcode_termcolors=256")
