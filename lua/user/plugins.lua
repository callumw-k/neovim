local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }) -- Quickly jump to symbols

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("MaxMEllon/vim-jsx-pretty")

	use("tpope/vim-commentary")

	-- Telescope
	use("nvim-telescope/telescope-project.nvim") -- Project navigation
	use("kyazdani42/nvim-web-devicons")
	use({ "callumw-k/telescope-file-browser.nvim" })
	use("styled-components/vim-styled-components")

	-- use("rmagatti/auto-session")
	-- use("rmagatti/session-lens")
	-- use("JoseConseco/telescope_sessions_picker.nvim")

	--Navigation & Quality of Life
	use("ggandor/lightspeed.nvim") -- Navigation
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- cmp plugins
	--
	use("hrsh7th/nvim-cmp") -- The completion pluginplug
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completion
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("simrat39/rust-tools.nvim") -- rust tools

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("github/copilot.vim")

	use("nvim-lualine/lualine.nvim")

	use("kyazdani42/nvim-tree.lua") -- Tree view
	use("lunarvim/onedarker.nvim")
	use("yong1le/darkplus.nvim")
	use("folke/tokyonight.nvim")
	use("joshdick/onedark.vim")
	use("sainnhe/sonokai")
	use("gruvbox-community/gruvbox")
	use("ayu-theme/ayu-vim")
	use("tpope/vim-fugitive") -- Git integration
	use("preservim/nerdtree") -- File tree

	if packer_bootstrap then
		require("packer").sync()
	end
end)
