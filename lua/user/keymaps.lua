local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

vim.g.maplocalleader = " "

keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('session-lens').search_session()<cr>", opts)
keymap("n", "<leader>pv", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
keymap('n', '<leader>fr', ":lua require'telescope'.extensions.project.project{}<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
