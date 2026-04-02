return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "j-hui/fidget.nvim" },
    },
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "saghen/blink.cmp",
    branch = "v1",
    build = "cargo build --release",
    config = function()
      require("blink.cmp").setup({
        snippets = { preset = "default" },
        sources = {
          default = { "lsp", "snippets", "buffer", "path" }
        },
        fuzzy = { implementation = "rust" },
        keymap = {
          ["<CR>"] = { "accept", "fallback" },
          ["<C-j>"] = { "select_next", "fallback_to_mappings" },
          ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
          ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
          ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
          ["<C-Space>"] = { "show", "fallback" }
        }
      })
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Lspsaga",
    keys = {
      { "<Leader>da", ":Lspsaga code_action<CR>" },
      { "<Leader>dr", ":Lspsaga rename<CR>" },
      { "<Leader>dp", ":Lspsaga peek_definition<CR>" },
      { "<Leader>df", ":Lspsaga finder<CR>" },
      { "<Leader>o",  ":Lspsaga outline<CR>" },
      { "gd",         ":Lspsaga goto_definition<CR>" },
    },
    config = function()
      require("lspsaga").setup({
        finder = {
          keys = {
            toggle_or_open = "<CR>"
          }
        },
        outline = {
          keys = {
            toggle_or_jump = "<CR>"
          }
        }
      })
    end
  }
}
