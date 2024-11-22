local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("n", "<leader>w", ":silent write<cr>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("v", "p", '"_dP', opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
