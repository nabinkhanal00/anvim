if has("win64")
	nnoremap <buffer> <leader>r <cmd>w<cr><cmd>TermExec cmd='g++ -o main \"%\" && ./main && rm main.exe'<cr>
else
	nnoremap <buffer> <leader>r <cmd>w<CR><cmd>TermExec cmd='g++ "%" -o main && ./main && rm main'<cr>
	nnoremap <buffer> <leader>cx <cmd>!g++ -o main % && objdump -D main > result.asm<cr>
endif
