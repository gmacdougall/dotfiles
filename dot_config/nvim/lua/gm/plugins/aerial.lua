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
    { '<leader>a', '<cmd>AerialToggle<CR>', desc = 'Aerial' },
  },
  lazy = true,
  opts = {
    on_attach = function(client, bufnr)
      local legendary = require('legendary')
      legendary.keymaps({
        {
          '{',
          '<cmd>AerialPrev<CR>',
          desc = 'Aerial previous item',
          opts = { buffer = bufnr },
        },
        {
          '}',
          '<cmd>AerialNext<CR>',
          desc = 'Aerial next item',
          opts = { buffer = bufnr },
        },
      })
    end,
  },
}
