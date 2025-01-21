return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  config = function()
    require('trouble').setup({})
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
