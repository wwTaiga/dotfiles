local g = vim.g
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_group_empty = 1

-- Integrate with project.nvim
g.nvim_tree_respect_buf_cwd = 1

vim.cmd([[autocmd BufEnter NvimTree set cursorline]])

require("nvim-tree").setup({
	update_cwd = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	filters = {
		custom = { ".git" },
	},
})
