return {
  'nvim-lua/plenary.nvim',

  -- Theme
  require('gm.plugins.tokyonight'),
  require('gm.plugins.notify'),

  -- Startup screen
  require('gm.plugins.alpha'),

  -- Keybindings
  require('gm.plugins.which-key'),

  -- Treesitter
  require('gm.plugins.treesitter'),

  -- LSP
  require('gm.plugins.mason'),
  require('gm.plugins.conform'),
  require('gm.plugins.lsp'),
  require('gm.plugins.trouble'),

  -- TypeScript
  require('gm.plugins.typescript'),

  -- Quickfix
  require('gm.plugins.bqf'),

  -- Fuzzy Finding
  require('gm.plugins.fzf-lua'),

  -- Testing
  require('gm.plugins.neotest'),

  -- Status Bars
  require('gm.plugins.bufferline'),
  require('gm.plugins.lualine'),

  -- Performance
  require('gm.plugins.startup-time'),

  -- Completion
  require('gm.plugins.blink'),

  -- LLM
  require('gm.plugins.codecompanion'),
}
