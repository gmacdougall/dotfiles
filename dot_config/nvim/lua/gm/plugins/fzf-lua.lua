return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    {
      '<leader>e',
      (vim.env.BIG_REPO and '<cmd>FzfLua git_files<CR>' or '<cmd>FzfLua files<CR>'),
      desc = 'Find files',
    },
    {
      '<leader>s',
      '<cmd>FzfLua git_status<CR>',
      desc = 'Find modified files',
    },
    {
      '<leader>fg',
      '<cmd>FzfLua live_grep<CR>',
      desc = 'Live grep',
    },
  },
  opts = {},
}
