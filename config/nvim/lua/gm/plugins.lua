return {
  "nvim-lua/plenary.nvim",
  require("gm.plugins.filetype"),

  -- Theme
  require("gm.plugins.catppuccin"),
  require("gm.plugins.notify"),
  require("gm.plugins.icons"),

  -- Startup screen
  require("gm.plugins.alpha"),

  -- Keybindings
  require("gm.plugins.legendary"),

  -- Treesitter
  require("gm.plugins.treesitter"),

  -- LSP
  require('gm.plugins.mason'),
  require('gm.plugins.formatter'),
  require('gm.plugins.lsp'),
  require('gm.plugins.trouble'),

  -- Code Folding
  require("gm.plugins.ufo"),

  -- Quickfix
  require("gm.plugins.bqf"),

  -- Fuzzy Finding
  require("gm.plugins.telescope"),

  -- Testing
  require("gm.plugins.neotest"),

  -- Status Bars
  require("gm.plugins.bufferline"),
  require("gm.plugins.feline"),

  -- Performance
  require("gm.plugins.startup-time"),
}
