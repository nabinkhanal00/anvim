nnoremap <buffer> <leader>r <cmd>w<CR><cmd>TermExec cmd="go run %"<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}

