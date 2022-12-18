call plug#begin(JoinPath(g:data_path, 'site', 'plugged'))
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kdheepak/lazygit.nvim',
Plug 'kyazdani42/nvim-tree.lua'
Plug 'chaoren/vim-wordmotion'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'mg979/vim-visual-multi'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'goolord/alpha-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-surround'
Plug 'ahmedkhalf/project.nvim'
Plug 'kevinhwang91/rnvimr'
Plug 'simrat39/symbols-outline.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'stevearc/dressing.nvim'
if filereadable(JoinPath(g:config_path, 'user', 'plugin.vim'))
	exec "source " . JoinPath(g:config_path, 'user', 'plugin.vim')
endif

call plug#end()
