return {
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>EE", ":NvimTreeFocus<CR>")
      vim.keymap.set("n", "<leader>ER", ":NvimTreeFindFile<CR>")
      vim.keymap.set("n", "<leader>ES", ":NvimTreeClose<CR>")
    end,
  },
}
