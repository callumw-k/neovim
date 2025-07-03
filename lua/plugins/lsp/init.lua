local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", function()
			require("telescope.builtin").lsp_definitions({})
		end, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- vim.keymap.set("n", "<leader>e", vim.lsp.diagnostic.show_line_diagnostics, opts)
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)

		vim.keymap.set("n", "<space>D", function()
			require("telescope.builtin").lsp_type_definitions({})
		end, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	end,
})

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0,
			})
		end,
	},
}
