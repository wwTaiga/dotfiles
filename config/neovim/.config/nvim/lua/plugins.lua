return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Common
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- Completion
	use("hrsh7th/nvim-cmp")
	-- Completion Source
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("Pocco81/DAPInstall.nvim")
	use("jbyuki/one-small-step-for-vimkind")
	use({ "michaelb/sniprun", run = "bash install.sh" })

	-- Editor Utils
	use("numToStr/Comment.nvim")
	use("ggandor/lightspeed.nvim")
	use("blackCauldron7/surround.nvim")
	use("windwp/nvim-autopairs")
	use("abecodes/tabout.nvim")
	use("mattn/emmet-vim")

	-- File explorer
	use("kyazdani42/nvim-tree.lua")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Keybindings
	use("folke/which-key.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("ray-x/lsp_signature.nvim")
	use("onsails/lspkind-nvim")
	use("folke/trouble.nvim")
	use("simrat39/symbols-outline.nvim")
	-- use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
	use("kosayoda/nvim-lightbulb")
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")

	-- Project navigation
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("ahmedkhalf/project.nvim")

	-- Snippet
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Text hightlight
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentString")
	use("folke/todo-comments.nvim")
	use({ "RRethy/vim-hexokinase", run = "make hexokinase" })
	use("lukas-reineke/indent-blankline.nvim")

	-- Text object
	use("kana/vim-textobj-user")
	use("whatyouhide/vim-textobj-xmlattr")
	use("michaeljsmith/vim-indent-object")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Ui
	use("folke/tokyonight.nvim")
	use("hoob3rt/lualine.nvim")
	use("akinsho/bufferline.nvim")
	use("glepnir/dashboard-nvim")
	use("karb94/neoscroll.nvim")

	-- Utils
	use("akinsho/toggleterm.nvim")
	use("nathom/filetype.nvim")
	use("https://gitlab.com/yorickpeterse/nvim-window.git")
end)
