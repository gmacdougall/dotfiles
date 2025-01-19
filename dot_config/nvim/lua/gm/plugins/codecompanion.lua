return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>a', '<cmd>CodeCompanionChat Toggle<CR>', desc = 'Toggle CodeCompanionChat' },
    { 'ga', '<cmd>CodeCompanionChat Add<CR>', desc = 'Add to CodeCompanionChat', mode = 'v' },
  },

  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'anthropic',
        },
      },
    })
  end,
}
