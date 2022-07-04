source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/plugins/init.vim
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/mappings.vim

if filereadable(expand("~/.config/nvim/user/init.vim"))
	source $HOME/.config/nvim/user/init.vim
endif
