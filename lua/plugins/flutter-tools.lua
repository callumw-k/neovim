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
					"<leader>ft",
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
			dev_log = {
				enabled = true,
				notify_errors = false,
				focus_on_open = false,
				auto_open = false,
				open_cmd = "10split",
			},
			fvm = true,
			dev_tools = {
				autostart = true,
				auto_open_browser = true,
			},
			lsp = { settings = { lineLength = 120 } },
		},
	},
}
