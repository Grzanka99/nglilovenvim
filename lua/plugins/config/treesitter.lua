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
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = {
    ensure_installed = ensure_installed,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("ts_context_commentstring").setup({
      enable = true,
      config = {
        javascriptreact = { style_element = "{/*%s*/}" },
      },
    })

    require("nvim-treesitter.configs").setup(opts)
  end,
}
