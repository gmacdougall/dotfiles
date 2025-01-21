return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  lazy = false,
  keys = {
    {
      '<leader>ti',
      function()
        require('typescript-tools.api').add_missing_imports()
      end,
      desc = 'TypeScript: Add Missing Imports',
    },
    {
      '<leader>to',
      function()
        require('typescript-tools.api').organize_imports()
      end,
      desc = 'TypeScript: Organize Imports',
    },
    {
      '<leader>tr',
      function()
        require('typescript-tools.api').file_references()
      end,
      desc = 'TypeScript: File References',
    },
  },
  opts = {},
  config = function()
    local remaps = require('gm.plugins.lsp.remaps')

    require('typescript-tools').setup({
      on_attach = function(client, bufnr)
        remaps.set_default_on_buffer(client, bufnr)
      end,
    })
  end,
}
