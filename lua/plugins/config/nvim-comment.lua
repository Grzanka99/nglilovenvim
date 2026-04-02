local fileTypes = { "vue", "typescript", "typescriptreact", "javascript", "javascriptreact" }

vim.keymap.set({ "n", "v" }, "<Leader>c", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<M-c>", ":CommentToggle<CR>", { noremap = true, silent = true })

local function contains(table, val)
  for i = 1, #table do
    if table[i] == val then
      return true
    end
  end
  return false
end

return {
  "terrortylor/nvim-comment",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = "CommentToggle",
  config = function()
    require("nvim_comment").setup({
      create_mappings = false,
      hook = function()
        if contains(fileTypes, vim.api.nvim_buf_get_option(0, "filetype")) then
          require("ts_context_commentstring.internal").update_commentstring()
        end
      end,
    })
  end,
}
