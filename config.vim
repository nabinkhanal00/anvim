let g:VM_maps={}
let g:VM_maps['Find Under']                  = '<M-n>'
let g:VM_maps['Find Subword Under']          = '<M-n>'
let g:VM_maps['Select All']                  = '\\A' 
let g:VM_maps['Add Cursor Down']             = '<M-Down>'
let g:VM_maps['Add Cursor Up']               = '<M-Up>'

set guifont=Space\ Mono\ for\ Powerline:h10

colorscheme tokyonight

sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint
