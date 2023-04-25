return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		keys = {
			{
				"n",
				"<leader>fs",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Fuzzy find in buffer",
			},
			{
				"<leader>fr",
				function()
					require("telescope").extensions.project.project({})
				end,
				desc = "Jump between projects",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Search text",
			},
			{
				"<leader>pv",

				function()
					require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
				end,
				desc = "File browser (telescope)",
			},
		},
		opts = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.load_extension("file_browser")
			telescope.load_extension("project")
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
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
					},
				},
			}
		end,
	},
}
