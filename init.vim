let g:config_path = stdpath('config')
let g:data_path = stdpath('data')
if has("win64")
	let g:path_sep = '\'
else
	let g:path_sep = '/'
endif

function! JoinPath(...)
	return join(a:000, g:path_sep)
endfunction

exec "source " . JoinPath(g:config_path, 'settings.vim')
exec "source " . JoinPath(g:config_path, 'plugin.vim')
exec "source " . JoinPath(g:config_path, 'plugins', 'init.vim')
exec "source " . JoinPath(g:config_path, 'config.vim')
exec "source " . JoinPath(g:config_path, 'mappings.vim')

if filereadable(JoinPath(g:config_path, 'user', 'init.vim'))
	exec "source " . JoinPath(g:config_path, 'user', 'init.vim')
endif
