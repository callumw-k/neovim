local M = {}

vim.cmd('autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-\\> <Cmd>exe v:count1 . "ToggleTerm"<CR>')

function M.setup()
	local ok, _ = pcall(require, "toggleterm")
	if not ok then
		return
	end

	local shell = "pwsh.exe"
	_.setup({
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})
end

return M
