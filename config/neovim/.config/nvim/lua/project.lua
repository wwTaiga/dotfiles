local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		prompt_prefix = "",
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

require("telescope").load_extension("fzf")

require("project_nvim").setup({
	detection_method = { "pattern", "lsp" },
	show_hidden = true,
})
require("telescope").load_extension("projects")
