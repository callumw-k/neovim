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
		config = function(_, opts)
			require("flutter-tools").setup(opts)
			require("telescope").load_extension("flutter")
		end,
		keys = function()
			local builtin = require("telescope").extensions

			return {
				{
					"<leader>ff",
					function()
						builtin.flutter.commands()
					end,
					"Flutter dev tools",
				},
				{
					"<leader>fi",
					"<cmd>FlutterLogToggle<cr>",
					"Flutter dev tools",
				},
			}
		end,
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
