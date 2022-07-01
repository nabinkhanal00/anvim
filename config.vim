let g:VM_maps={}
let g:VM_maps['Find Under']                  = '<C-n>'
let g:VM_maps['Find Subword Under']          = '<C-n>'
let g:VM_maps['Select All']                  = '\\A' 
let g:VM_maps['Add Cursor Down']             = '<C-Down>'
let g:VM_maps['Add Cursor Up']               = '<C-Up>'

set guifont=Space\ Mono\ for\ Powerline:h10

colorscheme tokyonight

sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint
