local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({ filetypes = { "javascriptreact", "typescriptreact", "javascript", "typescript" } }),
		formatting.stylua,
		formatting.black.with({ extra_args = { "--fast" } }),
		diagnostics.flake8,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
})
