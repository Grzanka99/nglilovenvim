return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFiel" },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
}
