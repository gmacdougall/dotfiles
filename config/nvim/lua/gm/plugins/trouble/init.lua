return {
  'folke/trouble.nvim',
  keys = {
    {
      '<leader>t',
      function()
        require('trouble').toggle()
      end,
      desc = 'Trouble window',
    },
  },
  config = function()
    local trouble = require('trouble')

    trouble.setup({})
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
