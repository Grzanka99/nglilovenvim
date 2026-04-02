vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME .. "/lua",
          "${3rd}/luv/library",
        },
        checkThirdParty = false,
      },
      diagnostics = {
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each",
          "pending",
        },
      },
      hint = {
        enable = true,
        paramType = true,
        paramName = true,
        setType = true,
      },
      typeInfo = {
        paddingLiveCheck = true,
      },
    },
  },
})
vim.lsp.enable("lua_ls")

return {}
