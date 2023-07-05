return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		opts = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.load_extension("fzf")
			return {
				defaults = {
					file_ignore_patterns = { "node_modules" },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			}
		end,
	},
}
