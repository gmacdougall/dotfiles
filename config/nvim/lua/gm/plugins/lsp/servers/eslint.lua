local util = require 'lspconfig.util'
local root_file = {
  '.git'
}

return {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
  },
  root_dir = function(fname)
    root_file = util.insert_package_json(root_file, 'eslintConfig', fname)
    return util.root_pattern(unpack(root_file))(fname)
  end,
}
