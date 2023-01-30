require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    'bash',
    'css',
    'fish',
    'graphql',
    'javascript',
    'lua',
    'ruby',
    'scss',
    'typescript',
    'vim',
    'yaml',
  },
}
