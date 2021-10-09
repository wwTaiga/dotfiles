local actions = require("telescope.actions.state")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".git/" },
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		prompt_prefix = "",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

require("telescope").load_extension("fzf")

require("project_nvim").setup({
	show_hidden = true,
})
require("telescope").load_extension("projects")
