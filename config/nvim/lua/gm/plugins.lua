vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  use 'tpope/vim-fugitive'

  use {
    "lazytanuki/nvim-mapper",
    config = function()
      require("nvim-mapper").setup{}
      require("gm.plugins.nvim-mapper")
    end,
    before = "telescope.nvim"
  }

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
  use 'kabouzeid/nvim-lspinstall'

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

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('gm.plugins.galaxyline') end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
