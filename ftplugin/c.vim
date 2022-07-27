nnoremap <buffer> <leader>cr <cmd>w<CR><cmd>exec Runcpp("%") <CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}

function! Runcpp(filename)
	if(filereadable(getcwd() .. "/Makefile"))
		execute 'TermExec cmd="make build && make run"'
	else
		let l:command="g++ -o main " .. a:filename .. " && ./main && rm main"
		execute 'TermExec cmd="' l:command '"'
	endif
endfunction
