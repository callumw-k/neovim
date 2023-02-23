local M = {}
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

M.setKeymaps = function()
	--Remap space as leader key
	keymap("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "


	-- keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
	keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
	keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
	keymap(
		"n",
		"<leader>pv",
		"<cmd>lua require 'telescope'.extensions.file_browser.file_browser({ path = '%:p:h' })<CR>",
		opts
	)
	keymap("n", "<leader>fr", ":lua require'telescope'.extensions.project.project{}<CR>", opts)

	-- Better window navigation
	keymap("n", "<C-h>", "<C-w>h", opts)
	keymap("n", "<C-j>", "<C-w>j", opts)
	keymap("n", "<C-k>", "<C-w>k", opts)
	keymap("n", "<C-l>", "<C-w>l", opts)

	-- Navigate buffers
	keymap("n", "<S-l>", ":bnext<CR>", opts)
	keymap("n", "<S-h>", ":bprevious<CR>", opts)

	-- Paste over currently selected text without yanking it
	keymap("v", "p", '"_dP', opts)

	-- Resizing panes
	keymap("n", "<Left>", ":vertical resize +1<CR>", opts)
	keymap("n", "<Right>", ":vertical resize -1<CR>", opts)
	keymap("n", "<Up>", ":resize -1<CR>", opts)
	keymap("n", "<Down>", ":resize +1<CR>", opts)
	-- Maximise Pane
	keymap("n", "<leader>mp", "<Cmd>WindowsMaximize<CR>", opts)

	require("lsp.keymaps").setGlobalLSPKeyMaps()
	--Close Code Action
	keymap("n", "<leader>cc", ":cclose", opts)
end

return M
