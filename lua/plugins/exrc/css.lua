local capabilities = require("blink.cmp").get_lsp_capabilities({
  textDocument = { completion = { completionItem = { snippetSupport = true } } }
})

vim.lsp.config("cssls", {
  capabilities = capabilities
})

vim.lsp.enable("cssls")

return {}
