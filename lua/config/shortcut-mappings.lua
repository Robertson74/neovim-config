vim.keymap.set("n", "<Leader>rso", ":source ~/.config/nvim/init.lua<CR>", { desc = "Resource config" })
vim.keymap.set("n", "<Leader>no", ":nohl<CR>", { desc = "Delete word" })
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<Leader>hl", ":help ", { desc = "search help" })

-- window nav
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>gt", "<C-w>l", { noremap = true, silent = true })

-- tabs
vim.keymap.set("n", "<Leader>tu", ":tabmove +1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>td", ":tabmove -1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "zl", "gt", { noremap = true, silent = true })
vim.keymap.set("n", "zh", "gT", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tc", ":tabclose<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>rnu", ":set rnu<CR>", { noremap = true, silent = true, desc = "Set relative numbers" })

vim.keymap.set("n", "<Leader>vvv", ":e ~/.config/nvim<CR>", { desc = "Edit vim config" })

vim.keymap.set("n", "<Leader>lw", ":set wrap<CR>", { desc = "Line wrap" })
vim.keymap.set("n", "<Leader>now", ":set nowrap<CR>", { desc = "No line wrap" })
