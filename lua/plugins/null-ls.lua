local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		async = false,
		bufnr = bufnr,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

local helpers = require("config.helpers")

return {
	"jay-babu/mason-null-ls.nvim",

	event = { "BufReadPre", "BufNewFile" },

	keys = {
		{
			"<leader>ff",
			function()
				vim.lsp.buf.format()
			end,
			"Format files",
		},
	},
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")

		local has_eslint = helpers.if_file_exist("eslint.*")
		local has_pubspec = helpers.if_file_exist("pubspec.*")

		local sources = {}

		if has_eslint then
			table.insert(sources, require("none-ls.diagnostics.eslint_d"))
			table.insert(sources, require("none-ls.code_actions.eslint_d"))
			table.insert(sources, require("none-ls.formatting.eslint_d"))
		end

		if has_pubspec then
			table.insert(sources, null_ls.builtins.formatting.dart_format)
		end

		null_ls.setup({
			sources = sources,
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
			ensure_installed = { "eslint_d", "stylua", "prettierd" },
			automatic_installation = true,
			handlers = {},
		})
	end,
}
