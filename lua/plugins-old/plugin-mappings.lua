local M = {}

vim.keymap.set("n", "<Leader>F", ":NvimTreeFindFileToggle<CR>", { desc = "Open file browser" })
vim.keymap.set("n", "<Leader>I", "<cmd>IBLToggle<cr>", { desc = "Toggle Indent Blankline" })
vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>", { desc = "Search Files" })
vim.keymap.set("n", "<Leader>gs", ":Telescope live_grep<CR>", { desc = "Search Files" })

-- -- LSP
-- function M.do_lsp_keybinding(bufnr)
--   local opts = { buffer = bufnr, noremap = true, silent = true }
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
--   vim.keymap.set("n", "KK", vim.lsp.buf.hover, opts) -- Show hover information
--   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
--   vim.keymap.set("n", "<leader>fix", vim.lsp.buf.code_action, opts) -- Code actions
--   vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- Show diagnostics
--   -- vim.keymap.set("n", "<leader>gr", vim.diagnostic.references, opts) -- Show diagnostics
-- end

return M;
