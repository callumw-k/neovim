local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
	debug = false,
	sources = {
		formatting.prettierd,
		--		formatting.prettier.with({ filetypes = { "javascriptreact", "typescriptreact", "javascript", "typescript" } }),
		formatting.stylua,
	},
	on_attach = function(client)
    local function file_exists(name)
      local f = io.open(name, "r")
      if f ~= nil then
        io.close(f)
        return true
      else
        return false
      end
    end
		if client.resolved_capabilities.document_formatting and file_exists(".prettierrc") then
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})

