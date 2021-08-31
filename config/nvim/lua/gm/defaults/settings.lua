-- Set <space> as leader
vim.g.mapleader = ' '

-- Enable line numbers on left column
vim.o.number = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true

vim.o.swapfile = true
vim.o.backup = false
vim.o.undofile = true

-- Give more space for displaying messages.
vim.o.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 50
