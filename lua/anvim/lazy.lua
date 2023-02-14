local lazypath = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({

	{ "folke/which-key.nvim", lazy = true },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
	},
	{
		"catppuccin/nvim",
		config = function()
			require('catppuccin').setup({
				flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
				background = { light = "latte", dark = "mocha" },
				transparent_background = true,
				term_colors = true,
				compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
			})
			vim.cmd.colorscheme("catppuccin")
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
	},
	{

		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-file-browser.nvim"
	},
	{
		"nvim-treesitter/nvim-treesitter",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"kdheepak/lazygit.nvim",
	},
	{
		"ahmedkhalf/project.nvim",
	},
	{
		"nvim-lualine/lualine.nvim",
	},
	{
		"romgrk/barbar.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
		"mfussenegger/nvim-dap",
		"jayp0521/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"nvim-telescope/telescope-dap.nvim",
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"SmiteshP/nvim-navic",
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",

		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
	},
	{
		"chaoren/vim-wordmotion",
	},
	{
		"p00f/cphelper.nvim",
		config = function()
			vim.cmd [[
			let g:cph#dir="/home/" .. $USER .. "/CP/Contests"
			let g:cph#vsplit="true"
			]]
		end
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		'toppair/peek.nvim',
		build = 'deno task --quiet build:fast',
		config = function() -- default config:
			require('peek').setup({
				auto_load = true, -- whether to automatically load preview when
				-- entering another markdown buffer
				close_on_bdelete = true, -- close preview window on buffer delete
				syntax = true, -- enable syntax highlighting, affects performance
				theme = 'dark', -- 'dark' or 'light'
				update_on_change = true,
				app = 'webview', -- 'webview', 'browser', string or a table of strings
				-- explained below

				-- relevant if update_on_change is true
				throttle_at = 200000, -- start throttling when file exceeds this
				-- amount of bytes in size
				throttle_time = 'auto', -- minimum amount of time in milliseconds
				-- that has to pass before starting new render
			})
			vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
			vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
		end
	}

})
