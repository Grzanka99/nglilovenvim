local ensure_installed = {
  "markdown",
  "markdown_inline",
  "lua"
}

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = ensure_installed,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
