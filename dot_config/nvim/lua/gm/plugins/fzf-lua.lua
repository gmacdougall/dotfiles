return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    {
      '<leader>e',
      '<cmd>FzfLua files<CR>',
      desc = 'Find files',
    },
    {
      '<leader>fg',
      '<cmd>FzfLua live_grep<CR>',
      desc = 'Live grep',
    },
  },
  opts = {},
}
