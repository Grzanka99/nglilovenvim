return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {
    modes = { insert = true, command = true, terminal = false },
  },
  config = function(_, opts)
    require("mini.pairs").setup(opts)
  end,
}
