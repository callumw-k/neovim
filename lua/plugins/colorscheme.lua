return {
	{
		enabled = false,
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			-- require("catppuccin").setup({ flavour = "frappe" })
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"navarasu/onedark.nvim",
		enabled = false,
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
