local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "typescript", "javascript", "python", "lua", "css" },
	sync_install = false,
	autopairs = { enable = true },
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
		enable = true,
		extend_mode = true,
		max_file_line = nil,
	},
	autotag = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
	},
})
