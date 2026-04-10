return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = { left = "|", right = "|" },
      section_separators = { left = " ", right = " " },
      disabled_filetypes = { "dashboard" },
    },
    sections = {
      lualine_b = {
        "branch",
        {
          "diff",
          source = function()
            local gs = vim.b.gitsigns_status_dict
            if gs then
              return { added = gs.added, modified = gs.changed, removed = gs.removed }
            end
          end,
        },
        { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
      },
      lualine_y = {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then return "LS Inactive" end
          local names = {}
          for _, client in pairs(clients) do
            names[#names + 1] = client.name
          end
          return " " .. table.concat(names, ", ")
        end,
      },
    },
  },
}

