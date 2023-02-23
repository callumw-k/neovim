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
	--Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.treesitter").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("configs.treesitter-context").setup()
		end,
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

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.cmp").setup()
		end,
	}, -- Autocompletion plugi,
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cm,
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	"ray-x/cmp-treesitter",

	--Null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls").setup()
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
	{
		"nvim-tree/nvim-tree.lua",
		tag = "nightly",
		config = function()
			require("configs.nvim-tree").setup()
		end,
	},

	-- Project
	"nvim-telescope/telescope-project.nvim",

	--Bufferline
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("configs.bufferline").setup()
		end,
	},

	--Theming
	{
		"navarasu/onedark.nvim",
		config = function()
			require("configs.colorscheme").setup()
		end,
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
	{
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment").setup()
		end,
	},
	{ "kyazdani42/nvim-web-devicons" },
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
