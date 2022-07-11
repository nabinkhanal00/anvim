nnoremap <buffer> <leader>cr <cmd>TermExec cmd="racket %"<cr>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
