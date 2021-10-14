-- Lsp UI config
local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

-- Make lsp config
local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return {
		capabilities = capabilities,
	}
end
-- Create on attach
local general_on_attach = function(client)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	})

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

-- Lua lsp setting
local lua_lsp_settings = {
	Lua = {
		runtime = {
			version = "LuaJIT",
			path = vim.split(package.path, ";"),
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = { "vim" },
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
			},
		},
	},
}

-- No format setting
local no_format_on_attach = function(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
	general_on_attach(client)
end

-- Lsp configuration
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local config = make_config()

	if server.name == "tsserver" or server.name == "jsonls" then
		config.on_attach = no_format_on_attach
	else
		config.on_attach = general_on_attach
	end

	if server.name == "sumneko_lua" then
		config.settings = lua_lsp_settings
	end

	server:setup(config)
	vim.cmd([[do User LspAttachBuffers]])
end)

-- General purpose lsp
local nl = require("null-ls")
local nl_f = nl.builtins.formatting -- Format sources
local nl_d = nl.builtins.diagnostics -- Diagnostics sources
nl.config({
	sources = {
		-- Lua
		nl_f.stylua,

		-- Web
		nl_f.prettier,
		nl_d.eslint_d,
	},
})
require("lspconfig")["null-ls"].setup({
	on_attach = general_on_attach,
})

-- Lsp Vscode like icon
require("lspkind").init({})

-- Lsp signature
require("lsp_signature").setup({
	bind = true,
	handler_opts = {
		border = "single",
	},
})

-- Lsp trouble
require("trouble").setup({})

-- Lsp utils
vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler

-- Lsp action lightbulb
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
