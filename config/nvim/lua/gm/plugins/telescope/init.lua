return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    local telescope = require('telescope')

    local functions = require('gm.utils.functions')

    telescope.setup({})

    require('gm.plugins.telescope.remaps')

    telescope.load_extension('ui-select')

    if functions.is_macunix() then
      telescope.load_extension('fzf')
    else
      vim.notify('not using fzf')
    end

    if pcall(require, 'project_nvim') then
      telescope.load_extension('projects')
    end

    if pcall(require, 'harpoon') then
      telescope.load_extension('harpoon')
    end

    if pcall(require, 'dap') then
      telescope.load_extension('dap')
    end

    if pcall(require, 'refactoring') then
      telescope.load_extension('refactoring')
    end
  end,
}
