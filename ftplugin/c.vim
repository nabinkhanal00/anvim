nnoremap <buffer> <leader>cr <cmd>w<CR><cmd>TermExec cmd="g++  -o main % -Wall && ./main && rm main"<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
