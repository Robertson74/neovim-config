-- for name, type in vim.fs.dir(path) do
--             local full_path = vim.fs.joinpath(path, name)
--             if type == "file" and name:match("%.lua$") then
--                 -- Convert file path to module name (e.g., "lua/config/plugins.lua" -> "config.plugins")
--                 local module_name = full_path
--                     :gsub(vim.fn.stdpath("config") .. "/lua/", "") -- Remove config/lua/ prefix
--                     :gsub("%.lua$", "") -- Remove .lua extension
--                     :gsub("/", ".") -- Replace / with .
--                 -- Attempt to require the module
--                 local ok, err = pcall(require, module_name)
--                 if not ok then
--                     vim.notify("Failed to require " .. module_name .. ": " .. err, vim.log.levels.ERROR)
--                 else
--                     vim.notify("Required " .. module_name, vim.log.levels.INFO)
--                 end
--             elseif type == "directory" then
--                 -- Recursively traverse subdirectories
--                 traverse_dir(full_path)
--             end
--         end
require('config.config')
require('config.navigation')
require('config.shortcut-mappings')
require('plugins.lazy')
require('plugins.plugin-mappings')
