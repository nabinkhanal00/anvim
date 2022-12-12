nnoremap <buffer> <leader>r <cmd>w<CR><cmd>TermExec cmd='g++ -o \"`dirname $(readlink -f %)`/main\" \"`readlink -f %`\" && \"`dirname $(readlink -f %)`/main\" && rm \"`dirname $(readlink -f %)`/main\" '<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}

" nnoremap <buffer> <leader>r <cmd>w<CR><cmd>exec Runcpp("%") <CR>
" function! Runcpp(filename)
" 	if(filereadable(getcwd() .. "/run.sh"))
" 		execute 'TermExec cmd="bash run.sh"'
" 	else
" 		let l:command='g++ -o main ' .. a:filename .. ' && ./main && rm main'
" 		execute 'TermExec cmd="' l:command '"'
" 	endif
" endfunction

nnoremap <buffer> <leader>cx <cmd>!g++ -o main % && objdump -D main > result.asm<cr>
