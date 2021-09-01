local lsp = require('lspconfig')

local prettier_d = require "gm.lsp.servers.formatters.prettier_d"
local eslint_d = require "gm.lsp.servers.linters.eslint_d"

local formatter = prettier_d
local linter = eslint_d

local languages = {
  --lua = {luafmt},
  typescript = {formatter, linter},
  javascript = {formatter, linter},
  typescriptreact = {formatter, linter},
  ['typescript.tsx'] = {formatter, linter},
  javascriptreact = {formatter, linter},
  ['javascript.jsx'] = {formatter, linter},
  vue = {formatter, linter},
  yaml = {formatter},
  json = {formatter},
  html = {formatter},
  scss = {formatter},
  css = {formatter},
  markdown = {formatter},
}

local efm_config = os.getenv('HOME') ..
                         '/.config/efm-langserver/config.yaml'

return function(language_server_path)
    local bin_path = language_server_path .. "/efm-langserver/efm-langserver"
    return {
      cmd = {
        bin_path,
        "-c",
        efm_config,
        --[[ "-loglevel",
        "10",
        "-logfile",
        "/tmp/efm.log" ]]
      },
      root_dir = function(fname)
        local cwd = lsp.util
        .root_pattern("tsconfig.json")(fname) or
        lsp.util
        .root_pattern(".eslintrc.json", ".git")(fname) or
        lsp.util.root_pattern("package.json", ".git/",
        ".zshrc")(fname);
        return cwd
      end,
      filetypes = vim.tbl_keys(languages),
      init_options = {
        documentFormatting = true
      },
      settings = {
        rootMarkers = { "package.json", ".git" },
        lintDebounce = 500,
        languages = languages
      },
    }
  end
