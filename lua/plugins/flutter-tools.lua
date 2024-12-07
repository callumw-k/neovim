return {
	{
		"jedrzejboczar/exrc.nvim",
		dependencies = { "neovim/nvim-lspconfig" }, -- (optional)
		opts = {},
	},
	{
		"nvim-flutter/flutter-tools.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		opts = {
			fvm = true,
			dev_tools = {
				autostart = true,
				auto_open_browser = true,
			},
			lsp = { settings = { lineLength = 120 } },
		},
	},
}
