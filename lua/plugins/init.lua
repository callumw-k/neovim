return {
	--Plugins
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",

	--LSP
	{
		"neovim/nvim-lspconfig",
	},
	{
		"simrat39/rust-tools.nvim",
	},
	{
		"jose-elias-alvarez/typescript.nvim",
	},
	--UI
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine").setup()
		end,
	},
	--Misc
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("configs.toggleterm").setup()
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("configs.leap").setup()
		end,
	},
	{ "folke/lsp-colors.nvim" },
	{ "lewis6991/impatient.nvim" },
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			require("configs.windows").setup()
		end,
	},
}
