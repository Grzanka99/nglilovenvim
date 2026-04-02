-- Better tabbing
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Move lines up/down
vim.keymap.set({ "v" }, "<M-j>", ":m'>+<CR>gv=gv", { desc = "Move visual selection down" })
vim.keymap.set({ "v" }, "<M-k>", ":m-2<CR>gv=gv", { desc = "Move visual selection up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- WINDOW / WORKSPACE NAVIAGATION AND MODIFICATION
-- Better window navigation

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to window right" })


-- Native LSP
vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to LSP definition" })
vim.keymap.set("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to LSP declaration" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show LSP hover info" })
vim.keymap.set("n", "D", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" })

-- Comments
vim.keymap.set("n", "<M-c>", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<M-c>", "gc", { desc = "Toggle comment", remap = true })

-- usefull
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })

vim.cmd("nnoremap q <Nop>")
