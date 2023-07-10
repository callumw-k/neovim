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
		})
	end,
}
