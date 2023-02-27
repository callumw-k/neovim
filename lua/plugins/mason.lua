return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("lsp.mason-lspconfig").setup()
		end,
		priority = 99,
	},
}
