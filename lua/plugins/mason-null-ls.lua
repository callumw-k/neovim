local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason").setup()
		local null_ls = require("null-ls")

		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})

		require("mason-null-ls").setup({
			ensure_installed = {},
			automatic_installation = true,
			handlers = {
				eslint = function(source_name, methods)
					null_ls.register(null_ls.builtins.diagnostics.eslint)
					null_ls.register(null_ls.builtins.code_actions.eslint)
				end,
				stylua = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.stylua)
				end,
			},
		})
	end,
}
