-- Config vim-hexokinase
vim.g.Hexokinase_highlighters = { "backgroundfull" }

-- Config treesitter and extensions
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c_sharp",
		"comment",
		"css",
		"html",
		"javascript",
		"json",
		"json5",
		"lua",
        "nix",
		"regex",
		"tsx",
		"typescript",
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		max_file_line = nil,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
	},
})

-- Todo Hightlight
require("todo-comments").setup({})

-- Indent line
vim.g.indentLine_fileTypeExclude = { "dashboard" }
require("indent_blankline").setup({
	char = "|",
	buftype_exclude = { "terminal" },
	show_current_context = true,
})
