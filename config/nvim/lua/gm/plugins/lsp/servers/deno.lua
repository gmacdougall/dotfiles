local lsp = require('lspconfig')

return {
  init_options = {
    enable = true,
    lint = true,
  },
  root_dir = lsp.util.root_pattern('deno.json'),
}
