return {
	"adalessa/laravel.nvim",
	dependencies = {
		"tpope/vim-dotenv",
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = { "Laravel" },
	keys = {
		{ "<leader>la", ":Laravel artisan<cr>" },
		{ "<leader>lr", ":Laravel routes<cr>" },
		{ "<leader>lm", ":Laravel related<cr>" },
	},
	event = { "VeryLazy" },
	opts = {},
}
