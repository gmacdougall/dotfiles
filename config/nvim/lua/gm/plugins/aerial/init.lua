return {
  'stevearc/aerial.nvim',
  cmd = {
    'AerialToggle',
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>a', '<cmd>AerialToggle<CR>', desc = 'Aerial' },
    { '{', '<cmd>AerialPrev<CR>', desc = 'Aerial previous item' },
    { '{', '<cmd>AerialNext<CR>', desc = 'Aerial next item' },
  },
  lazy = true,
  opts = {},
}
