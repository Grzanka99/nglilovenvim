return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = {
      { "gd",         function() Snacks.picker.lsp_definitions() end,  desc = "Goto definition" },
      { "gr",         function() Snacks.picker.lsp_references() end,   desc = "Goto references" },
      { "gD",         function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
      { "K",          vim.lsp.buf.hover,                               desc = "Hover" },
      { "D",          vim.diagnostic.open_float,                       desc = "Diagnostics" },
      { "<Leader>da", vim.lsp.buf.code_action,                         desc = "Code action" },
      { "<Leader>dr", vim.lsp.buf.rename,                              desc = "Rename" },
    },
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
  }
}
