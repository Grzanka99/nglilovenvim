local format_is_enabled = true
vim.api.nvim_create_user_command("ToggleFormatting", function()
  format_is_enabled = not format_is_enabled
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if not format_is_enabled then
      return
    end

    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.lsp.buf.format()
    vim.fn.winrestview(save)
  end,
})
