-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- add plugins
require("lazy").setup({
  spec = {
    { 'neoclide/coc.nvim', branch = 'release', },
    -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        -- lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },
    -- {
    --   "folke/lazydev.nvim",
    --   ft = "lua", -- only load on lua files
    --   opts = {
    --     library = {
    --       -- See the configuration section for more details
    --       -- Load luvit types when the `vim.uv` word is found
    --       { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --     },
    --   },
    -- },
  -- { -- optional cmp completion source for require statements and module annotations
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, {
  --       name = "lazydev",
  --       group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --     })
  --   end,
  -- },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },

    -- Which-key
    {
        'folke/which-key.nvim',
        -- lazy = true,
    },
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    -- LSP configuration
    -- { "neovim/nvim-lspconfig" },
    -- Mason for managing LSP servers
    -- { "williamboman/mason.nvim" },
    -- { "williamboman/mason-lspconfig.nvim" },
    -- Autocompletion
    -- { "hrsh7th/nvim-cmp" },
    -- { "hrsh7th/cmp-nvim-lsp" },
    -- { "hrsh7th/cmp-buffer" },
    -- { "hrsh7th/cmp-path" },
    -- { "L3MON4D3/LuaSnip" },
    -- { "saadparwaiz1/cmp_luasnip" },
    -- -- Non-LSP tools integration
    { "nvim-lua/plenary.nvim" }, -- Dependency for none-ls
    -- { "nvimtools/none-ls.nvim" },
    -- import your plugins
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
      'numToStr/Comment.nvim',
      opts = {
        -- add any options here
      }
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          -- respect_buf_cwd = true,
          update_focused_file = {
            enable = true,
          }
        }
      end,
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

----------------------------------------------------------------------------------------------------
----------- LSP
----------------------------------------------------------------------------------------------------
-- Mason setup
-- require("mason").setup()
-- require("mason-lspconfig").setup({
--   ensure_installed = { "pyright", "ts_ls", "lua_ls" }, -- Install Python, TypeScript, Lua servers
--   automatic_installation = true, -- Auto-configure servers with lspconfig
-- })
--
-- -- LSP configuration
-- local lspconfig = require("lspconfig")
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- local bindings = require('plugins.plugin-mappings')
-- local on_attach = function(client, bufnr)
--   -- bindings.do_lsp_keybinding(bufnr)
-- end
--
-- -- Configure LSP servers
-- lspconfig.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
-- lspconfig.ts_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
--
-- lspconfig.lua_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
--
-- local cmp = require("cmp")
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body) -- Snippet expansion with LuaSnip
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<C-V>"] = cmp.mapping.complete(), -- Trigger completion
--     ["<C-e>"] = cmp.mapping.abort(), -- Cancel completion
--     ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
--     ["<Tab>"] = cmp.mapping.select_next_item(), -- Navigate completion menu
--     ["<S-Tab>"] = cmp.mapping.select_prev_item(),
--   }),
--
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" }, -- LSP completions
--     { name = "luasnip" }, -- Snippet completions
--     { name = "buffer" }, -- Buffer completions
--     { name = "path" }, -- Path completions
--   }),
-- })



-- nvim-cmp setup
-- none-ls setup for non-LSP tools
-- local none_ls = require("none-ls")
-- none_ls.setup({
--   sources = {
--     none_ls.builtins.formatting.prettier, -- JavaScript/TypeScript formatter
--     none_ls.builtins.diagnostics.eslint, -- JavaScript/TypeScript linter
--   },
-- })
--
-- Basic diagnostic settings
vim.diagnostic.config({
  virtual_text = true, -- Show diagnostics inline
  signs = true, -- Show signs in the gutter
  update_in_insert = false, -- Don’t update diagnostics while typing
})
----------------------------------------------------------------------------------------------------
----------- NVIM TREE RECOMMENDED
----------------------------------------------------------------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
----------- NVIM TREE RECOMMENDED END
