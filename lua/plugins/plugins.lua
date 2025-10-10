local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require('plugins.cmp'),
  require('plugins.format-lint'),
  require('plugins.nvim-tree'),
  require('plugins.telescope'),
  require('plugins.treesitter'),
  require('plugins.catppuccin'),
  require('plugins.which-key'),
  require('plugins.hop'),
  -- require('plugins.lsp-config'),
  -- require('plugins.nvim-cmp'),
  -- require('plugins.mason'),
  require('plugins.neominimap'),
  require('plugins.git-gutter'),
  require('plugins.coc'),
})

-- vim.lsp.config('lua_ls', {
--   on_init = function(client)
--     if client.workspace_folders then
--       local path = client.workspace_folders[1].name
--       if
--         path ~= vim.fn.stdpath('config')
--         and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
--       then
--         return
--       end
--     end
--
--     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most
--         -- likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Tell the language server how to find Lua modules same way as Neovim
--         -- (see `:h lua-module-load`)
--         path = {
--           'lua/?.lua',
--           'lua/?/init.lua',
--         },
--       },
--       -- Make the server aware of Neovim runtime files
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME
--           -- Depending on the usage, you might want to add additional paths
--           -- here.
--           -- '${3rd}/luv/library'
--           -- '${3rd}/busted/library'
--         }
--         -- Or pull in all of 'runtimepath'.
--         -- NOTE: this is a lot slower and will cause issues when working on
--         -- your own configuration.
--         -- See https://github.com/neovim/nvim-lspconfig/issues/3189
--         -- library = {
--         --   vim.api.nvim_get_runtime_file('', true),
--         -- }
--       }
--     })
--   end,
--   settings = {
--     Lua = {}
--   }
-- })
-- vim.lsp.enable('lua_ls')
--
