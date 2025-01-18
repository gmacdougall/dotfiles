return {
  'stevearc/aerial.nvim',
  cmd = {
    'AerialToggle',
    'AerialPrev',
    'AerialNext',
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>o', '<cmd>AerialToggle<CR>', desc = 'Aerial' },
  },
  lazy = true,
  config = function()
    require('aerial').setup()
  end,
}
