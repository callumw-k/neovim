local M = {}

M.lua_ls = {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

return M
