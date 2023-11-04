local util = require('lspconfig.util')

return {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
  },
  root_dir = function(fname)
    return util.find_git_ancestor(fname)
  end,
}
