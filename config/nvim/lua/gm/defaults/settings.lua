local vim = vim
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
  showmatch = true,
  -- vim.o.nohlsearch
  hidden = true,
  errorbells = false,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  smarttab = true,
  wrap = false,

  number = true,
  relativenumber = false,
  smartcase = true,
  swapfile = false,
  backup = false,
  undofile = true,
  incsearch = true,
  termguicolors = true,
  scrolloff = 6,

  -- live preview of substitutions
  inccommand = 'split',
  -- Give more space for displaying messages.
  cmdheight = 1,

  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)

  -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  -- delays and poor user experience.
  updatetime = 50,

  -- Set completeopt to have a better completion experience
  -- :help completeopt
  -- menuone: popup even when there's only one match
  -- noinsert: Do not insert text until a selection is made
  -- noselect: Do not select, force user to select one from the menu
  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp

  -- column & git column
  signcolumn = 'yes:2',

  cursorline = false,
  cursorcolumn = false,

  -- done by status bar
  showmode = false,

  -- show spaces
  list = true,
  listchars = 'tab:>·,trail:~,extends:>,precedes:<',

  -- global statusline
  laststatus = 3,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append('c')

vim.g.loaded_matchparen = 1
vim.g.mapleader = ' '
