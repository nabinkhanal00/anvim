nnoremap <buffer> <leader>cr <cmd>w<CR><cmd>TermExec cmd="ts-node %"<CR>
autocmd BufWritePre <buffer> :lua vim.lsp.buf.format{}
