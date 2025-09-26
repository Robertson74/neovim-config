return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>FD", builtin.find_files, {})
      vim.keymap.set("n", "<leader>FG", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>FB", builtin.buffers, {})
    end,
  },
}
