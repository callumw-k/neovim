return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("file_browser")
		end,

		keys = function()
			local builtin = require("telescope.builtin")
			return {
				-- { "<leader>pv", ":Telescope file_browser<CR>" },
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
			}
		end,
	},
}
