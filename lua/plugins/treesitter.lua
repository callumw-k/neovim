return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
	},
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown" },
		},
		context_commentstring = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		indent = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
		-- ensure_installed = { "tsx", "typescript", "javascript", "python", "rust", "lua", "css", "regex" },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
