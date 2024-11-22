return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		use_default_keymaps = false,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-v>"] = {
				"actions.select",
				opts = { vertical = true, close = true },
				desc = "Open the entry in a vertical split",
			},
			["<C-h>"] = {
				"actions.select",
				opts = { horizontal = true, close = true },
				desc = "Open the entry in a horizontal split",
			},
			["<leader>p"] = {
				"actions.select",
				opts = { tab = true, close = true },
				desc = "Open the entry in new tab",
			},
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
	},
	keys = {
		{
			"<leader>pv",
			function()
				require("oil").open()
			end,
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
