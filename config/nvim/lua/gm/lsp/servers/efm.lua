local lsp = require("lspconfig")

-- npm install -g eslint_d
-- npm install -g @fsouza/prettierd
-- npm install -g stylelint
-- npm install -g alex
-- paru -S stylua
-- paru -S luacheck
-- paru -S shfmt-bin
-- paru -S shellcheck-bin
--
-- https://github.com/creativenull/efmls-configs-nvim/blob/main/supported-linters-and-formatters.md
local prettier_d = require("efmls-configs.formatters.prettier_d")
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

local languages = {
	lua = { stylua, luacheck },
	typescript = { prettier_d },
	javascript = { prettier_d },
	typescriptreact = { prettier_d },
	["typescript.tsx"] = { prettier_d },
	javascriptreact = { prettier_d },
	["javascript.jsx"] = { prettier_d },
	yaml = { prettier_d },
}

return {
  root_dir = function(fname)
    local cwd = lsp.util.root_pattern("tsconfig.json")(fname)
      or lsp.util.root_pattern(".eslintrc.json", ".git")(fname)
      or lsp.util.root_pattern("package.json", ".git/", ".zshrc")(fname)
    return cwd
  end,
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { "package.json", ".git" },
    lintDebounce = 500,
    languages = languages,
  },
}
