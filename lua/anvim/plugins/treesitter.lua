require 'nvim-treesitter.install'.compilers = { 'gcc' }
require 'nvim-treesitter.configs'.setup {
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
}
