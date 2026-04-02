local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"

vim.opt.rtp:prepend(lazypath)

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

local specs = {
  { "tpope/vim-sleuth" },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  { import = "plugins.config.colorscheme" },
  { import = "plugins.config.lsp" },
  { import = "plugins.config.neotree" },
  { import = "plugins.config.gitsigns" },
  { import = "plugins.config.treesitter" },
  { import = "plugins.config.bufferline" },
  { import = "plugins.config.lualine" },
  { import = "plugins.config.harpoon" },
  { import = "plugins.config.telescope" },
  { import = "plugins.config.nvim-comment" },
  { import = "plugins.config.nvim-autopairs" },
}

if vim.g.project_type ~= nil then
  if vim.tbl_contains(vim.g.project_type, "lua") then
    vim.list_extend(specs, require("plugins.exrc.lua"))
  end

  if vim.tbl_contains(vim.g.project_type, "html") then
    vim.list_extend(specs, require("plugins.exrc.html"))
  end
end

require("lazy").setup(specs)
