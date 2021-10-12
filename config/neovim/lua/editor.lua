-- Surround
require("surround").setup({ mappings_style = "surround" })

-- Commentary
require("Comment").setup({
	---@diagnostic disable-next-line: unused-local
	pre_hook = function(ctx)
		return require("ts_context_commentstring.internal").calculate_commentstring()
	end,
})

-- Auto pair
require("nvim-autopairs").setup({})
require("nvim-autopairs.completion.cmp").setup({
	map_cr = true,
	map_complete = true,
	auto_select = true,
	insert = false,
	map_char = {
		all = "(",
		tex = "{",
	},
})

-- Tab out
require("tabout").setup({
	tabkey = "<Tab>",
	backwards_tabkey = "<S-Tab>",
	act_as_tab = true,
	act_as_shift_tab = false,
	enable_backwards = true,
	completion = true,
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = "`", close = "`" },
		{ open = "(", close = ")" },
		{ open = "[", close = "]" },
		{ open = "{", close = "}" },
	},
	ignore_beginning = true,
	exclude = {},
})

-- Smooth scrolling
require("neoscroll").setup()
