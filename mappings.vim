inoremap <silent> <C-l> <Esc><C-w>li
inoremap <silent> <C-h> <Esc><C-w>hi


nnoremap J m`YP``
vnoremap J m`YP``v``
nnoremap Y y$

inoremap , ,<c-g>u
inoremap <space>  <space><c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <C-a>  G$vgg^

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

nnoremap <silent> H  <cmd>bprevious<CR>
nnoremap <silent> L <cmd>bnext<CR>

nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>

nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>

nnoremap <silent> [e <cmd>lua vim.diagnostic.goto_prev{wrap = false}<cr>
nnoremap <silent> ]e <cmd>lua vim.diagnostic.goto_next{wrap = false}<cr>

nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<cr>

imap <C-H> <C-w>
imap <C-BS> <C-w>

nnoremap <M-y> "+y
vnoremap <M-y> "+y
tnoremap <M-y> <C-\><C-n>"+y

nnoremap <M-p> "+p
vnoremap <M-p> "+p
tnoremap <M-p> <C-\><C-n>"+p
