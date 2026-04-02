local ok, blink = pcall(require, "blink.cmd")

local capabilities = ok and blink.get_lsp_capabilities({
  textDocument = { completion = { completionItem = { snippetSupport = true } } }
}) or nil

vim.lsp.config("cssls", {
  capabilities = capabilities
})

return {}
