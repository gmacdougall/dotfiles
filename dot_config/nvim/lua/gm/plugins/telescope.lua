return {
  'nvim-telescope/telescope.nvim',
  keys = {
    {
      '<leader>fg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Live grep',
    },
    {
      '<leader>sc',
      function()
        require('telescope.builtin').find_files({
          prompt_title = '< VimConfig >',
          cwd = '$HOME/.config/nvim',
        })
      end,
      desc = 'Search vim config',
    },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({})
    telescope.load_extension('ui-select')
    telescope.load_extension('fzf')
  end,
}
