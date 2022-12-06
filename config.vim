let g:VM_maps={}

let g:VM_maps['Find Subword Under']          = '<M-d>'
let g:VM_maps['Find Under']          		 = '<M-d>'
let g:VM_maps['Select All']                  = '\\A' 
let g:VM_maps['Add Cursor Down']             = '<M-Down>'
let g:VM_maps['Add Cursor Up']               = '<M-Up>'

colorscheme tokyonight

sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint

autocmd FileType c,cpp setlocal commentstring=//\ %s 

autocmd BufNewFile,BufRead *.vert set ft=glsl
autocmd BufNewFile,BufRead *.frag set ft=glsl
