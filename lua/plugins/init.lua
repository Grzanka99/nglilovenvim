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

local loaded_exrc = {}
local function extend_specs(specsref, mod)
  if loaded_exrc[mod] then return end
  loaded_exrc[mod] = true
  vim.list_extend(specsref, { { import = mod } })
end

if vim.g.project_type ~= nil then
  if vim.tbl_contains(vim.g.project_type, "lua") then
    extend_specs(specs, "plugins.exrc.lua")
  end

  if vim.tbl_contains(vim.g.project_type, "html") then
    extend_specs(specs, "plugins.exrc.html")
    extend_specs(specs, "plugins.exrc.css")
    print(vim.inspect(specs))
  end


  if vim.tbl_contains(vim.g.project_type, "biome") then
    extend_specs(specs, "plugins.exrc.biome")
  end

  if vim.tbl_contains(vim.g.project_type, "typescript") then
    extend_specs(specs, "plugins.exrc.typescript")
  end

  if vim.tbl_contains(vim.g.project_type, "vue") then
    extend_specs(specs, "plugins.exrc.vue")
    extend_specs(specs, "plugins.exrc.html")
    extend_specs(specs, "plugins.exrc.css")
  end

  print(vim.inspect(specs))
end


require("lazy").setup(specs)
