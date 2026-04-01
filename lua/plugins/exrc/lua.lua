vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")


return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        lua = { "stylua" },
      })
    end
  }
}
