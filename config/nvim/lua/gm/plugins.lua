return {
  'nvim-lua/plenary.nvim',
  require('gm.plugins.filetype'),

  -- Theme
  require('gm.plugins.tokyonight'),
  require('gm.plugins.notify'),

  -- Startup screen
  require('gm.plugins.alpha'),

  -- Keybindings
  require('gm.plugins.legendary'),

  -- Treesitter
  require('gm.plugins.treesitter'),

  -- LSP
  require('gm.plugins.mason'),
  require('gm.plugins.conform'),
  require('gm.plugins.lsp'),
  require('gm.plugins.trouble'),

  -- Quickfix
  require('gm.plugins.bqf'),

  -- Fuzzy Finding
  require('gm.plugins.telescope'),

  -- Testing
  require('gm.plugins.neotest'),

  -- Status Bars
  require('gm.plugins.bufferline'),
  require('gm.plugins.lualine'),

  -- Performance
  require('gm.plugins.startup-time'),
}
