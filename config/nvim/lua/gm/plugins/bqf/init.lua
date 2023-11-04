return {
  'kevinhwang91/nvim-bqf',
  config = function()
    local bqf = require('bqf')

    bqf.setup({
      auto_enable = true,
    })
  end,
  event = 'VeryLazy',
}
