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

pcall(require, "impatient")

return require('packer').startup(function(use)
  --Plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  --LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'mhartington/formatter.nvim'
  use { "folke/trouble.nvim", config = function() require("config.trouble").setup() end }

  --  DAP
  use {
    "mfussenegger/nvim-dap",
    opt = true,
    event = "BufReadPre",
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    requires = {
      "Pocco81/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
    config = function()
      require("config.dap").setup()
    end,
  }

  --Treesitte
  use { 'nvim-treesitter/nvim-treesitter', config = function() require("config.treesitter").setup() end }
  use { 'windwp/nvim-autopairs', config = function() require("config.autopairs").setup() end }
  use { "windwp/nvim-ts-autotag", event = "InsertEnter",
    config = function() require("nvim-ts-autotag").setup { enable = true } end, }

  use { 'hrsh7th/nvim-cmp', config = function() require("config.cmp").setup() end } -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'ray-x/cmp-treesitter'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  --Null-ls
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require("config.null-ls").setup() end }

  --Telescope and telescope extensions
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', config = function() require("config.telescope").setup() end }
  use "callumw-k/telescope-file-browser.nvim"

  -- Project
  use 'nvim-telescope/telescope-project.nvim'

  --Bufferline
  use { 'akinsho/bufferline.nvim', tag = "v2.*", config = function() require("config.bufferline").setup() end }

  --Theming
  use { 'navarasu/onedark.nvim', config = function() require("config.colorscheme").setup() end }

  --UI
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', config = function() require("config.lualine").setup() end }
  }

  --Misc
  use { "folke/which-key.nvim", config = function() require("config.whichkey").setup() end }
  use { 'akinsho/toggleterm.nvim', config = function() require("config.toggleterm").setup() end }
  use { "ggandor/leap.nvim" }
  use { "numToStr/Comment.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "folke/lsp-colors.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      require("config.windows").setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
