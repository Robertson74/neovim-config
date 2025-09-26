-- Function to recursively require all .lua files in a directory and its subdirectories
local function require_all_lua_files(start_path)
    -- Ensure start_path is a directory
    if vim.fn.isdirectory(start_path) == 0 then
        vim.notify("Invalid directory: " .. start_path, vim.log.levels.ERROR)
        return
    end

    -- Recursive function to traverse directories
    local function traverse_dir(path)
        for name, type in vim.fs.dir(path) do
            local full_path = vim.fs.joinpath(path, name)
            if type == "file" and name:match("%.lua$") then
                -- Convert file path to module name (e.g., "lua/config/plugins.lua" -> "config.plugins")
                local module_name = full_path
                    :gsub(vim.fn.stdpath("config") .. "/lua/", "") -- Remove config/lua/ prefix
                    :gsub("%.lua$", "") -- Remove .lua extension
                    :gsub("/", ".") -- Replace / with .
                -- Attempt to require the module
                local ok, err = pcall(require, module_name)
                if not ok then
                    vim.notify("Failed to require " .. module_name .. ": " .. err, vim.log.levels.ERROR)
                else
                    vim.notify("Required " .. module_name, vim.log.levels.INFO)
                end
            elseif type == "directory" then
                -- Recursively traverse subdirectories
                traverse_dir(full_path)
            end
        end
    end

    -- Start traversal from the given path
    traverse_dir(start_path)
end

-- Example: Command to require all .lua files in ~/.config/nvim/lua/
vim.api.nvim_create_user_command('RequireAllLua', function()
    local lua_dir = vim.fn.stdpath("config") .. "/lua"
    vim.notify("Requiring all Lua files in " .. lua_dir, vim.log.levels.INFO)
    require_all_lua_files(lua_dir)
end, {})
