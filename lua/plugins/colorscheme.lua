return {
	{
		"navarasu/onedark.nvim",
		config = function()
			local onedark = require("onedark")
			onedark.setup({
				style = "deep",
			})
			onedark.load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
