return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  config = function()
    local mason = require('mason')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup()

    mason_tool_installer.setup({
      ensure_installed = {
        'prettier',
        'prettierd',
        'stylua',
        'luacheck',
        'gitlint',
        'jsonlint',
        'rubocop',
        'ruby_ls',
        'eslint-lsp',
      },

      auto_update = false,
      run_on_start = false,
    })
  end,
  dependencies = {
    'williamboman/mason.nvim',
  },
}
