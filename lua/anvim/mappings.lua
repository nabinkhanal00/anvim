-- Lsp Configurations
vim.cmd([[
" copy the current line to next line
nnoremap J m`YP``

" copy current selection to next line
vnoremap J m`YP``v``

" yank till the end of the line from start of the cursor
nnoremap Y y$

inoremap , ,<c-g>u
inoremap <space>  <space><c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" nnoremap <C-a>  G$vgg^

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

nnoremap <M-p> "+p
vnoremap <M-p> "+p

vnoremap < <gv
vnoremap > >gv

" some mappings for neovim terminal to work in neovide
if exists('g:neovide')
	tnoremap <C-S-c> <C-\><C-n>"+yi
	tnoremap <C-S-v> <C-\><C-n>"+pi
	tnoremap <M-y> <C-\><C-n>"+y
	tnoremap <M-p> <C-\><C-n>"+p
	tnoremap <C-H> <C-w>
	tnoremap <C-BS> <C-w>
endif
]])
