return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<Leader>ha", ":lua require('harpoon.mark').add_file()<CR>" },
    { "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    { "<M-1>",      ":lua require('harpoon.ui').nav_file(1)<CR>" },
    { "<M-2>",      ":lua require('harpoon.ui').nav_file(2)<CR>" },
    { "<M-3>",      ":lua require('harpoon.ui').nav_file(3)<CR>" },
    { "<M-4>",      ":lua require('harpoon.ui').nav_file(4)<CR>" },
    { "<M-5>",      ":lua require('harpoon.ui').nav_file(5)<CR>" },
  },
}
