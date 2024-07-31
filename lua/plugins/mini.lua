return {
	{
		"echasnovski/mini.files",
		version = "*",
		enabled = true,
		config = function()
			local mappings = {
				p = {
					v = {
						function()
							require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
						end,
						"Open file explorer",
					},
				},
			}
			require("defaults.utils").which_key_register(mappings)
			require("mini.files").setup({
				mappings = {
					synchronize = "<space>w",
					go_in_plus = "<cr>",
				},
				windows = {
					width_preview = 100,
					preview = true,
				},
			})
		end,
	},
}
