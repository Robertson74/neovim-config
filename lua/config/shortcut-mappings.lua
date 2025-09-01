vim.keymap.set("n", "<Leader>rso", ":source ~/.config/nvim/init.lua<CR>", { desc = "Resource config" })
vim.keymap.set("n", "<Leader>no", ":nohl<CR>", { desc = "Delete word" })
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<Leader>hl", ":help ", { desc = "search help" })
vim.keymap.set("n", "<Leader>vev", ":e ~/.config/nvim<CR>", { desc = "Open vim config" })

-- window nav
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
