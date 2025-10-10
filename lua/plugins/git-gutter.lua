return {
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPost", "BufNewFile" }, -- Load on buffer open
    config = function()
      -- Optional: Customize gitgutter settings
      vim.g.gitgutter_sign_added = "+"      -- Sign for added lines
      vim.g.gitgutter_sign_modified = "~"   -- Sign for modified lines
      vim.g.gitgutter_sign_removed = "-"    -- Sign for removed lines
      vim.g.gitgutter_sign_priority = 10    -- Ensure signs don't conflict with others
      vim.g.gitgutter_async = 1             -- Enable async updates (recommended)

      -- Keymaps for hunk navigation and actions
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "]c", "<Plug>(GitGutterNextHunk)", opts) -- Next hunk
      vim.keymap.set("n", "[c", "<Plug>(GitGutterPrevHunk)", opts) -- Previous hunk
      -- vim.keymap.set("n", "<leader>hs", "<Plug>(GitGutterStageHunk)", opts) -- Stage hunk
      -- vim.keymap.set("n", "<leader>hu", "<Plug>(GitGutterUndoHunk)", opts) -- Undo hunk
      -- vim.keymap.set("n", "<leader>hp", "<Plug>(GitGutterPreviewHunk)", opts) -- Preview hunk
    end,
  },
}
-- vim.opt.signcolumn = "yes"
