return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notifier = { enabled = true },
    dashboard = { enabled = true },
    image = {
      enabled = true,
      doc = {
        inline = true,
        float = true
      }
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
          win = { list = { border = "left" } },
          include = { "plans", "plans/**" },
        },
      },
    },
    explorer = { enabled = true, trash = false },
    bigfile = { enabled = true },
    input = { enabled = true, win = { relative = "cursor" } },
    words = { enabled = true },
    statuscolumn = { enabled = true },
    rename = { enabled = true }
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
