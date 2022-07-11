nnoremap <buffer> <leader>cr <cmd>w<CR><cmd>TermExec cmd="node %"<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
