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
  { import = "plugins.config.colorscheme" },
  { import = "plugins.config.neotree" },
  { import = "plugins.config.lsp" }
}

if vim.g.project_type ~= nil then
  if vim.tbl_contains(vim.g.project_type, "lua") then
    vim.list_extend(specs, require("plugins.exrc.lua"))
  end
end

require("lazy").setup(specs)
