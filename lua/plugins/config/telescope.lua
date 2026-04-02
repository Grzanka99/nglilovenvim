return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "ThePrimeagen/harpoon",
  },
  cmd = "Telescope",
  keys = {
    { "<Leader>ff", ":Telescope find_files<CR>" },
    { "<Leader>fb", ":Telescope buffers<CR>" },
    { "<M-b>",      ":Telescope buffers<CR>" },
    { "<Leader>fg", ":Telescope live_grep<CR>" },
    { "<Leader>fs", ":Telescope lsp_document_symbols<CR>" },
    { "<Leader>fh", ":Telescope harpoon marks<CR>" },
    { "<Leader>dt", ":Telescope diagnostics<CR>" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node%_modules/.*" },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
      },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("harpoon")
  end,
}
