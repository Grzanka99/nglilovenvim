return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    { "<leader>dd", "<cmd>CodeDiff<CR>",            desc = "CodeDiff" },
    { "<leader>dc", "<cmd>CodeDiff develop...<CR>", desc = "CodeDiff against develop" },
  },
  opts = {
    diff = {
      compute_moves = true,
    },
    explorer = {
      view_mode = "tree"
    }
  }
}
