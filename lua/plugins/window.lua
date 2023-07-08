return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = false

		local mappings = {
			m = {
				p = {
					":WindowsMaximize<cr>",
					"Maximise Window",
				},
			},
		}
		require("defaults.utils").which_key_register(mappings)
		require("windows").setup()
	end,
}
