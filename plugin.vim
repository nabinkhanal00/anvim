let s:plug_path= expand('~/.local/share/nvim/site/autoload/plug.vim')

let s:install_plugins = 0

if !filereadable(s:plug_path)
	let s:install_plugins = 1
	silent! exec  'silent !curl -fLo "' . s:plug_path .  '" --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/site/plugged')
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
Plug 'p00f/cphelper.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-orgmode/orgmode'
if filereadable(expand('~/.config/nvim/user/plugin.vim'))
	source ~/.config/nvim/user/plugin.vim
endif

call plug#end()

if s:install_plugins
	silent! exec  'silent  PlugInstall'
	silent! exec  'silent bd'
endif
