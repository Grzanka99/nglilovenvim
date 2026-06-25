local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("intelephense", {
  capabilities = capabilities,
  settings = {
    intelephense = {
      stubs = {
        "wordpress",
        "standard",
        "date",
        "filter",
        "json",
        "mbstring",
        "mysqli",
        "pcre",
        "spl",
      },
    },
  },
})

vim.lsp.enable("intelephense")

return {}
