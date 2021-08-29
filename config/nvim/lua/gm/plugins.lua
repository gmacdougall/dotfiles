-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  print("Downloading packer.nvim...")
  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloaded packer.nvim")

  print("Reopen NVIM and run :PackerSync twice")

  return
end

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  -- JS Stuff
  --use 'HerringtonDarkholme/yats.vim'
  --use 'elzr/vim-json'
  --use 'mxw/vim-jsx'
  --use 'pangloss/vim-javascript'
  --use 'peitalin/vim-jsx-typescript'

  -- Ruby stuff
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'

  -- Replace with LSP
  use 'prettier/vim-prettier'
  use 'w0rp/ale'

  use 'MarcWeber/vim-addon-local-vimrc'
  use 'Raimondi/delimitMate'
  use 'bling/vim-airline'
  use 'bronson/vim-trailing-whitespace'
  use 'editorconfig/editorconfig-vim'
  use 'ekalinin/Dockerfile.vim'
  use 'rking/vim-detailed'
  use 'rust-lang/rust.vim'
  use 'spolu/dwm.vim'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-markdown'
  use 'tpope/vim-sensible'
  use 'tpope/vim-sleuth'
  use 'neovim/nvim-lspconfig'

  -- New stuff
  use { 'junegunn/fzf', run = './install --all' }
  use {
    'junegunn/fzf.vim',
    config = function() require('gm.plugins.fzf') end
  }

  use {
    "lazytanuki/nvim-mapper",
    config = function() require("nvim-mapper").setup{} end,
    before = "telescope.nvim"
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require("telescope").load_extension("mapper") end
  }
end)
