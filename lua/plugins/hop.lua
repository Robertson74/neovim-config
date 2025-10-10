vim.keymap.set("n", "<Leader><Leader>", ":HopWord<CR>", { desc = "Hop to word" })

return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {},
  config = function(_, opts)
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection
    hop.setup(opts)
    -- Example mappings (customize as needed)
    -- vim.keymap.set("n", "<leader>f", function()
    --   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    -- end, { remap = true })
    -- vim.keymap.set("n", "<leader>F", function()
    --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    -- end, { remap = true })
    -- Add more for words/lines: HopWord, HopLine, etc.
  end,
}

