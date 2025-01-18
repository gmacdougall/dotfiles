return {
  'akinsho/bufferline.nvim',
  lazy = false,
  keys = {
    { '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', desc = 'Switch to Buffer 1' },
    { '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', desc = 'Switch to Buffer 2' },
    { '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', desc = 'Switch to Buffer 3' },
    { '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', desc = 'Switch to Buffer 4' },
    { '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', desc = 'Switch to Buffer 5' },
    { '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', desc = 'Switch to Buffer 6' },
    { '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', desc = 'Switch to Buffer 7' },
    { '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', desc = 'Switch to Buffer 8' },
    { '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', desc = 'Switch to Buffer 9' },
    { '<leader>0', '<cmd>BufferLineGoToBuffer 10<CR>', desc = 'Switch to Buffer 10' },
    { '<C-c>', ':bd<CR>', desc = 'Close the current buffer' },
  },
  config = function()
    local bufferline = require('bufferline')

    bufferline.setup({
      options = {
        diagnostics = 'nvim_lsp',
      },
    })
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
