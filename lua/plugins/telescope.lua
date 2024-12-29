return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			})
			telescope.load_extension("file_browser")
		end,

		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{
					"<leader>fp",
					function()
						builtin.find_files()
					end,
					"Search files",
				},
				{
					"<leader>fg",
					function()
						builtin.live_grep()
					end,
					"Search text",
				},
				{
					"<leader>fs",
					function()
						builtin.lsp_document_symbols()
					end,
					"Search symbols",
				},
				{
					"<leader>fb",
					function()
						builtin.buffers()
					end,
					"Search buffers",
				},
				{
					"<leader>fr",
					function()
						builtin.lsp_references()
					end,
					"Search buffers",
				},
			}
		end,
	},
}
