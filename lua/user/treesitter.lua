local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "typescript", "javascript", "python", "lua", "css" },
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
		extend_mode = true,
		max_file_line = nil,
	},
	autotag = {
		enable = true,
	},
})
