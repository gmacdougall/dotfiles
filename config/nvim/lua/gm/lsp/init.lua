local lspconfig = require("lspconfig")

local remaps = require("gm.lsp.remaps")

local presentLspStatus, lsp_status = pcall(require, "lsp-status")
local presentCmpNvimLsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local presentLspSignature, lsp_signature = pcall(require, "lsp_signature")

vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

local function on_attach(client, bufnr)
	remaps.set_default_on_buffer(client, bufnr)

	if presentLspStatus then
		lsp_status.on_attach(client)
	end

	if presentLspSignature then
		lsp_signature.on_attach({ floating_window = false, timer_interval = 500 })
	end

	if client.name == "tsserver" then
		-- let prettier format
		client.server_capabilities.document_formatting = false
		client.server_capabilities.documentFormattingProvider = false
	end
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = true,
	-- enables lsp_lines but we want to start disabled
	virtual_lines = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focus = false,
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

local capabilities

if presentCmpNvimLsp then
	capabilities = cmp_lsp.default_capabilities()
else
	capabilities = vim.lsp.protocol.make_client_capabilities()
end

if presentLspStatus then
	lsp_status.register_progress()
	capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
end

local servers = {
  eslint = {},
  solargraph = require('gm.lsp.servers.solargraph'),
  sorbet = require('gm.lsp.servers.sorbet'),
  sumneko_lua = require('gm.lsp.servers.sumneko_lua'),
  tailwindcss = require('gm.lsp.servers.tailwindcss'),
}

if vim.env.LSP_DENO then
  servers['denols'] = require('gm.lsp.servers.deno')
else
  servers['tsserver'] = require('gm.lsp.servers.tsserver')(on_attach)
  servers['efm'] = require('gm.lsp.servers.efm')
end

local default_lsp_config = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 200,
		allow_incremental_sync = true,
	},
}

local server_names = {}
for server_name, _ in pairs(servers) do
	table.insert(server_names, server_name)
end
--[[ setupped by typescript package so we need to ensure installed by mason ]]
table.insert(server_names, "tsserver")

local present_mason, mason = pcall(require, "mason-lspconfig")
if present_mason then
	mason.setup({ ensure_installed = server_names })
end

local present_typescript, typescript = pcall(require, "typescript")

if present_typescript then
	typescript.setup({
		server = {
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
			end,
		},
	})
end

for server_name, server_config in pairs(servers) do
	local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

	lspconfig[server_name].setup(merged_config)

	if server_name == "rust_analyzer" then
		local present_rust_tools, rust_tools = pcall(require, "rust-tools")

		if present_rust_tools then
			rust_tools.setup({ server = merged_config })
		end
	end
end
