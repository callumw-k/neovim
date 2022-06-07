local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<leader>pv", ":NvimTreeToggle<cr>", opts)
-- keymap("n", "<leader>pv", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('session-lens').search_session()<cr>", opts)
keymap("n", "<leader>fr", ":lua require'telescope'.extensions.project.project{}<CR>", opts)
keymap("i", "<S-Insert>", "<C-R>*", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap('n', '<leader>n', ':NvimTreeFindFile', opts)
keymap("n", "<leader>pv", ":Telescope file_browser<cr>", opts)
