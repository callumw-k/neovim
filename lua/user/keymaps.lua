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
keymap("n", "<leader>fr", ":Telescope projects<cr>", opts) 
keymap("i", "<S-Insert>", "<C-R>*", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap('n', '<leader>n', ':NvimTreeFindFile', opts)
keymap("n", "<leader>pv", ":Telescope file_browser<cr>", opts)
keymap("n", "<leader>fh", ":Format<cr>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>/", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", opts)
keymap("n", "<leader>d", ":bd!<CR>", opts)
keymap("n", "<leader>bda", ":%bd!<CR>", opts)
