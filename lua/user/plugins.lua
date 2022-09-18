local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  --Plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  --LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'mhartington/formatter.nvim'
  use { "folke/trouble.nvim", config = function() require("user.trouble-config.init").setup() end }

  --Treesitte
  use 'nvim-treesitter/nvim-treesitter'
  use { 'windwp/nvim-autopairs', config = function() require("user.autopairs").setup() end }
  use {
    "windwp/nvim-ts-autotag",
    wants = "nvim-treesitter",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup { enable = true }
    end,
  }

  --CMP
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'ray-x/cmp-treesitter'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  --Null-ls
  use 'jose-elias-alvarez/null-ls.nvim'

  --Telescope and telescope extensions
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use "callumw-k/telescope-file-browser.nvim"

  -- Project
  use 'nvim-telescope/telescope-project.nvim'

  --Bufferline
  use { 'akinsho/bufferline.nvim', tag = "v2.*", config = function() require("user.bufferline-config").setup() end }

  --Theming
  use 'navarasu/onedark.nvim'

  --Misc
  use { "folke/which-key.nvim", config = function() require("user.whichkey-config.init").setup() end }
  use "ggandor/leap.nvim"
  use 'numToStr/Comment.nvim'
  use "kyazdani42/nvim-web-devicons"
  use { 'akinsho/toggleterm.nvim', config = function() require("user.toggleterm").setup() end }
  use "folke/lsp-colors.nvim"
  use "lewis6991/impatient.nvim"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
