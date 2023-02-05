return {
  "nvim-lua/plenary.nvim",
  require("gm.plugins.filetype"),

  -- Theme
  require("gm.plugins.catppuccin"),
  require("gm.plugins.notify"),
  require("gm.plugins.icons"),

  -- Startup screen
  require("gm.plugins.alpha"),

  -- Treesitter
  require("gm.plugins.treesitter"),

  -- LSP
  require('gm.plugins.mason'),
  require('gm.plugins.lsp'),

  -- Code Folding
  require("gm.plugins.ufo"),

  -- Fuzzy Finding
  require("gm.plugins.telescope"),

  -- Status Bars
  require("gm.plugins.bufferline"),
  require("gm.plugins.feline"),
}
