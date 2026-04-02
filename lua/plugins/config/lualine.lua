local function lsp_info(msg)
  msg = msg or "LS Inactive"

  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })

  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return "LS Inactive"
    end
    return msg
  end
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  local return_string = msg

  if #buf_client_names > 0 then
    return_string = " " .. table.concat(buf_client_names, ", ") .. ""
  end

  return return_string
end

local function diagnostics_ex()
  return {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
  }
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = " " },
        disabled_filetypes = { "dashboard" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", {
          "diff",
          source = function()
            local gs = vim.b.gitsigns_status_dict
            if gs then
              return { added = gs.added, modified = gs.changed, removed = gs.removed }
            end
          end
        }, diagnostics_ex() },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { lsp_info },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = { "neo-tree" },
    })
  end,
}
