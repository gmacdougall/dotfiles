return {
  'akinsho/bufferline.nvim',
  init = function()
    local r = require('gm.utils.remaps')

    r.noremap('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', 'Switch to Buffer 1')
    r.noremap('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', 'Switch to Buffer 2')
    r.noremap('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', 'Switch to Buffer 3')
    r.noremap('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', 'Switch to Buffer 4')
    r.noremap('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', 'Switch to Buffer 5')
    r.noremap('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', 'Switch to Buffer 6')
    r.noremap('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', 'Switch to Buffer 7')
    r.noremap('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', 'Switch to Buffer 8')
    r.noremap('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', 'Switch to Buffer 9')
    r.noremap('n', '<leader>0', '<cmd>BufferLineGoToBuffer 10<CR>', 'Switch to Buffer 10')

    r.noremap('n', '<C-c>', ':bd<CR>', 'Close the current buffer')
  end,
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
