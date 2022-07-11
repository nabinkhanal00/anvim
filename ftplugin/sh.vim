nnoremap <buffer> <leader>cr <cmd>w<CR><cmd>TermExec cmd="bash %"<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
