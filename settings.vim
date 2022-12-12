" set leader key
let g:mapleader = "\<Space>"

syntax enable                           
set hidden                              
set nowrap                              
set encoding=utf-8                      
set pumheight=10                        
set fileencoding=utf-8                  
set ruler                               
set cmdheight=1                         
set iskeyword+=-                        
set mouse=a                             
set splitbelow                          
set splitright                          
set t_Co=256                            
set tabstop=4
set conceallevel=0                      
set smartindent                         
set autoindent                          
set laststatus=2                        
set shiftwidth=4
set number                              
set background=dark                     
set showtabline=2                       
set noshowmode                          
set updatetime=300                      
set timeoutlen=500                      
set autochdir                           
set signcolumn=yes                      
set title
set numberwidth=3
set completeopt=menu,noselect,noinsert
set clipboard+=unnamedplus
set so=999
autocmd FileType * setlocal formatoptions-=cro
syntax on


if has("win64")
	let &shell = executable('pwsh') ? 'pwsh -NoLogo' : 'powershell'
	let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	set shellquote= shellxquote=
endif
