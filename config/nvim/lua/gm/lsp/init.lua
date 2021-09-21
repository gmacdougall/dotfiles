local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  local Mapper = require("nvim-mapper")
  local function buf_set_keymap(keys, cmd, identifier, description)
    Mapper.map_buf(bufnr, "n", keys, cmd, opts, "LSP", identifier, description)
  end
  local function buf_keymap_old(...) vim.api.nvim_buf_set_keymap(bufnr, 'n', ...) end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap(
    'gd',
    '<Cmd>lua vim.lsp.buf.definition()<CR>',
    'lsp_definition',
    'Jump to the declaration of the symbol under the cursor'
  )
  buf_set_keymap(
    'K',
    '<Cmd>lua vim.lsp.buf.hover()<CR>',
    'lsp_hover',
    'Bring up the hover menu for the symbol under the cursor'
  )
  buf_set_keymap(
    "<space>lf",
    "<cmd>lua vim.lsp.buf.formatting()<CR>",
    "lsp_format",
    "Auto-format the current file"
  )
  buf_set_keymap(
    '<space>rn',
    '<cmd>lua vim.lsp.buf.rename()<CR>',
    'lsp_rename',
    'Rename the current variable everywhere it is used'
  )
  buf_set_keymap(
    'gi',
    '<cmd>lua vim.lsp.buf.implementation()<CR>',
    'lsp_implementation',
    'Go to the location of the implementation'
  )
  buf_set_keymap(
    'gr',
    '<cmd>lua vim.lsp.buf.references()<CR>',
    'lsp_references',
    'Open the quickfix window with a list of references to this'
  )
  buf_set_keymap(
    '<space>d',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    'lsp_diagnostics',
    'Show further detail of the error on the current line'
  )

  -- format on save
  vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
end

local default_lsp_config = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
  --capabilities = lsp_status.capabilities
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  denols = require('gm.lsp.servers.deno'),
  efm = require('gm.lsp.servers.efm'),
  solargraph = require('gm.lsp.servers.solargraph'),
  sorbet = require('gm.lsp.servers.sorbet'),
  sumneko_lua = {
    cmd = { 'lua-language-server' },
  },
  tailwindcss = require('gm.lsp.servers.tailwindcss'),
  tsserver = require('gm.lsp.servers.tsserver')(on_attach),
}

for server, config in pairs(servers) do
  nvim_lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end
