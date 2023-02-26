return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"tsserver",
				"prettierd",
				"lua_ls",
				"eslint",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("lsp.mason-lspconfig").setup()
		end,
	},
}
