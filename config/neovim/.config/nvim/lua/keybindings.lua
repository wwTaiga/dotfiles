require("which-key").setup({})

vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "jk", "<esc>", {})
vim.api.nvim_set_keymap("n", "<esc>", "<cmd>:noh<cr><esc>", { noremap = true })
-- C-H == C-BS in terminal
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })
-- Luasnip Keybindings ----------------------------------------------------------
local luasnip = require("luasnip")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
	if luasnip and luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	else
		return t("<Plug>(Tabout)")
	end
end

_G.s_tab_complete = function()
	if luasnip and luasnip.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t("<Plug>(TaboutBack)")
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap(
	"i",
	"<S-Tab>",
	"v:lua.s_tab_complete()",
	{ expr = true }
)
vim.api.nvim_set_keymap(
	"s",
	"<S-Tab>",
	"v:lua.s_tab_complete()",
	{ expr = true }
)
----------------------------------------------------------------------------------

local wk = require("which-key")
wk.register({
	["<leader>"] = {
		["."] = { "<cmd>Telescope live_grep<cr>", "Grep line" },
		d = {
			name = "Debug",
			c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
			i = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
			l = {
				name = "Launch",
				l = { "<cmd>lua require('osv').launch()<cr>", "Lua" },
			},
			n = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
			r = { "<cmd>SnipRun<cr>", "Run code" },
			s = { "<cmd>SnipClose<cr>", "Stop run code" },
			t = {
				"<cmd>lua require('dap').toggle_breakpoint()<cr>",
				"Toggle breakpoint",
			},
		},
		e = {
			name = "Extensions / Plugins",
			c = { "<cmd>PackerCompile<cr>", "Compile plugins" },
			C = { "<cmd>PackerClean<cr>", "Clean plugins" },
			i = { "<cmd>PackerInstall<cr>", "Install plugins" },
			s = { "<cmd>PackerSync<cr>", "Sync plugins" },
		},
		f = {
			name = "File",
			t = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorer" },
		},
		g = {
			name = "Git",
			b = {
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				"Blane current line",
			},
			g = { "<cmd>lua _Lazygit_toggle()<cr>", "Open git status" },
		},
		l = {
			name = "Lsp",
			-- a = { "<cmd>CodeActionMenu<cr>", "Actions" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
			d = {
				"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>",
				"Show diagnostics",
			},
			i = { "<cmd>LspInfo<cr>", "Lsp info" },
			l = {
				name = "List",
				d = {
					"<cmd>TroubleToggle lsp_definitions<cr>",
					"Show definitions list",
				},
				l = {
					"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>",
					"Show diagnostics list",
				},
				r = {
					"<cmd>TroubleToggle lsp_references<cr>",
					"Show references lsit",
				},
			},
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>SymbolsOutline<cr>", "Symbol" },
			t = {
				"<cmd>lua vim.lsp.buf.type_definition()<cr>",
				"Type definition",
			},
			w = {
				name = "Workspace",
				a = {
					"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
					"Add workspace",
				},
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
					"List workspace",
				},
				r = {
					"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
					"Remove workspace",
				},
			},
		},
		p = {
			name = "Project",
			c = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
			f = { "<cmd>Telescope find_files<cr>", "Find file" },
			h = { "<cmd>Telescope oldfiles<cr>", "Find history" },
			l = { "<cmd>TodoTelescope<cr>", "List TODO comments" },
			m = { "<cmd>Telescope marks<cr>", "Find marks" },
			n = { "<cmd>DashboardNewFile<cr>", "New file" },
			p = { "<cmd>Telescope projects<cr>", "Switch project" },
			s = { "<cmd>SessionLoad<cr>", "Load last session" },
		},
		w = {
			name = "Window",
			c = { "<cmd>q<cr>", "Close window" },
			h = { "<C-w>h", "Go to left window" },
			j = { "<C-w>j", "Go to bottom window" },
			k = { "<C-w>k", "Go to upper window" },
			l = { "<C-w>l", "Go to right window" },
			p = {
				"<cmd>lua require('nvim-window').pick()<cr>",
				"Pick window",
			},
			q = { "<cmd>qa<cr>", "Quit Neovim" },
			s = { "<cmd>sp<cr>", "Split horizontally" },
			v = { "<cmd>vsp<cr>", "Split vertically" },
		},
	},
	["<"] = {
		d = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Go to prev diagnostic",
		},
	},
	[">"] = {
		d = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
			"Go to next diagnostic",
		},
	},
	g = {
		t = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
		T = { "<cmd>BufferLinePickClose<cr>", "Close buffer" },
		C = {
			"<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
			"Close all other buffers",
		},
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
		i = {
			"<cmd>lua vim.lsp.buf.implementation()<cr>",
			"Go to implementation",
		},
		r = {
			"<cmd>lua require('telescope.builtin').lsp_references("
				.. "{layout_strategy='vertical'})<cr>",
			"Go to references",
		},
	},
	K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover info" },
	["<C-k>"] = {
		"<cmd>lua vim.lsp.buf.signature_help()<cr>",
		"Show signature help",
	},
})
