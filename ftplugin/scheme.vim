nnoremap <buffer> <leader>r <cmd>TermExec cmd="racket %"<cr>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
