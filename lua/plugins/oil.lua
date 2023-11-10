return {
	"stevearc/oil.nvim",
	dependencies = {
		"folke/which-key.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local mappings = {
			p = {
				v = {
					function()
						require("oil").open()
					end,
					"Open file explorer",
				},
			},
		}
		require("defaults.utils").which_key_register(mappings)
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
			},
			use_default_keymaps = false,
		})
	end,
}
