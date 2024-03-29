return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')

    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.buttons.val = {
      dashboard.button('e', ' New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', ' Recent files', ':Telescope oldfiles<CR>'),

      dashboard.button('c', ' Config', ':e $MYVIMRC | pwd<CR>'),
      dashboard.button('u p', ' Update plugins', ':Lazy update<CR>'),
      dashboard.button('u l', ' Update LSP', '<cmd>Mason<CR>'),

      dashboard.button('q', ' Quit NVIM', ':qa<CR>'),
    }

    local stats = require('lazy').stats()

    dashboard.section.footer.val = {
      string.format('   %d plugins (%d loaded)', stats.count, stats.loaded),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
