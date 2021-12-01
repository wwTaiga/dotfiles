-- Lsp UI config
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local border = "rounded"

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
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{ border = border }
	)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = border }
	)

	if client.resolved_capabilities.document_formatting then
		vim.cmd(
			"autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
		)
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
		nl_f.prettierd,
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

-- Lsp action lightbulb
vim.fn.sign_define(
	"LightBulbSign",
	{ text = " ", texthl = "DiagnosticWarn" }
)

vim.cmd(
	[[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
)
