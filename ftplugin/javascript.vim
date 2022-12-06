nnoremap <buffer> <leader>r <cmd>w<CR><cmd>TermExec cmd="node %"<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
