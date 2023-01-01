nnoremap <buffer> <leader>r <cmd>w<CR><cmd>TermExec cmd="nasm -f elf64 -o objectfile % && ld -o binfile objectfile && ./binfile && rm binfile && rm objectfile"<CR>
