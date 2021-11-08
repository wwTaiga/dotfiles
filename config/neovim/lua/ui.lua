-- Statusline
require("lualine").setup({
	options = {
		disabled_filetypes = { "NvimTree" },
		theme = "tokyonight",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
		},
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

-- Colorscheme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree", "packer" }
vim.cmd([[colorscheme tokyonight]])

-- Tabline
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,

		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
					or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
			},
		},
		separator_style = "slant",
	},
})

-- Dashboard settings
local g = vim.g
g.dashboard_default_executive = "telescope"
g.dashboard_custom_shortcut = {
	book_marks = "SPC p m",
	change_colorscheme = "SPC p c",
	find_file = "SPC p f",
	find_history = "SPC p h",
	find_word = "SPC .  ",
	last_session = "SPC p s",
	new_file = "SPC p n",
}
-- Save session on exit neovim
vim.api.nvim_exec(
	[[
        autocmd VimLeave * silent! SessionSave
    ]],
	false
)
