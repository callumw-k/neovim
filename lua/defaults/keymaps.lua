local M = {}
local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

M.setup = function()
	keymap("", "<Space>", "<Nop>", opts)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

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
	-- -- Maximise Pane
	-- keymap("n", "<leader>mp", "<Cmd>WindowsMaximize<CR>", opts)

	keymap("n", "<space>e", vim.diagnostic.open_float, opts)
	keymap("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap("n", "]d", vim.diagnostic.goto_next, opts)
	keymap("n", "<space>q", vim.diagnostic.setloclist, opts)
end

return M
