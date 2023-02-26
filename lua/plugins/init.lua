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
	{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({ enable = true })
		end,
	},

	--Telescope and telescope extensions
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("configs.telescope").setup()
		end,
	},
	"nvim-telescope/telescope-file-browser.nvim",

	-- Project
	"nvim-telescope/telescope-project.nvim",

	--Theming

	--UI
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine").setup()
		end,
	},

	--Misc
	{
		"folke/which-key.nvim",
		config = function()
			require("configs.whichkey").setup()
		end,
	},
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
