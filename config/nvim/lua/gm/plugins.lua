vim.cmd [[packadd packer.nvim]]

local presentImpatient, impatient = pcall(require, 'impatient')

if presentImpatient then
  impatient.enable_profile()
end

return require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim'

  -- Packer can manage itself as an optional plugin
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }

  use 'tpope/vim-fugitive'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'}
    },
    config = function()
      require("telescope").load_extension("mapper")
      require('gm.plugins.telescope')
    end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'romgrk/barbar.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      "lazytanuki/nvim-mapper",
    },
    config = function() require('gm.plugins.barbar') end,
  }

  -- Theme
  use {
    'bluz71/vim-moonfly-colors',
    config = function() vim.cmd('colorscheme moonfly') end,
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = "lazytanuki/nvim-mapper",
    config = function() require('gm.lsp') end,
  }
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use("williamboman/nvim-lsp-installer")
  use({
    "creativenull/efmls-configs-nvim",
    requires = { "neovim/nvim-lspconfig" },
  })

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- Language packs
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() vim.cmd [[TSUpdate]] end,
    config = function() require('gm.plugins.treesitter') end
  }

  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function() require('nvim-gps').setup({}) end
  }

  -- Lua Development
  use {
    'tjdevries/nlua.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/completion-nvim',
      'euclidianAce/BetterLua.vim',
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup({}) end,
  }
end)
