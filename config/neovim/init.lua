-- Bootstrapping packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.mouse = "a"
vim.o.hidden = true
vim.o.updatetime = 250

-- Highlight on yank
vim.api.nvim_exec(
	[[
        augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
        augroup end
    ]],
	false
)

-- Plugin
require("plugins")

-- Plugin config
require("completion")
require("debugger")
require("editor")
require("file-explorer")
require("git")
require("keybindings")
require("lsp")
require("project")
require("term")
require("text-hightlight")
require("ui")
