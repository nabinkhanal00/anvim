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
		}
	},
	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end

	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{ "goolord/alpha-nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	},
	{
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'jose-elias-alvarez/null-ls.nvim',
		'jayp0521/mason-null-ls.nvim',
		'mfussenegger/nvim-dap',
		'jayp0521/mason-nvim-dap.nvim',
	}
})
