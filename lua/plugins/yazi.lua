---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	event = { "VeryLazy" },
	-- lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	-- priority = vim.fn.argc(1) == 0 and 1000 or 0,
	enabled = false,
	keys = {
		{
			"<leader>pv",
			"<cmd>Yazi cwd<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>pd",
			"<cmd>Yazi<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		floating_window_scaling_factor = 0.95,
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
