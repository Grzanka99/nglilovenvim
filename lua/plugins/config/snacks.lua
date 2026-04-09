return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notifier = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
          win = { list = { border = "left" } },
        },
      },
    },
    explorer = { enabled = true },
    bigfile = { enabled = true },
    input = { enabled = true },
    words = { enabled = true },
    statuscolumn = { enabled = true },
  },
  keys = {
    { "<Leader>ff", function() Snacks.picker.files() end,       desc = "Find files" },
    { "<Leader>fb", function() Snacks.picker.buffers() end,     desc = "Buffers" },
    { "<M-b>",      function() Snacks.picker.buffers() end,     desc = "Buffers" },
    { "<Leader>fg", function() Snacks.picker.grep() end,        desc = "Live grep" },
    { "<Leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP document symbols" },
    { "<Leader>dt", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<M-space>",  function() Snacks.explorer() end,           desc = "Explorer" },
  },
}
