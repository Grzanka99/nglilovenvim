vim.lsp.config('tsgo', {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  preferences = {
    includeCompletionsForModuleExports = true,
    includeCompletionsWithInsertText = true,
  }
})

vim.lsp.enable("tsgo")

return {
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      require("ts-error-translator").setup()
    end
  }
}
