let mapleader = "<space>"

"mappings
nnoremap f ^
nnoremap F $
vnoremap f ^
vnoremap F $

" Simulate same TAB behavior in VSCode
nmap <S-l> :Tabnext<CR>
nmap <S-h> :Tabprevious<CR>

nnoremap J m`YP``
vnoremap J m`YP``v``

nnoremap <silent><space>w :call VSCodeCall("workbench.action.files.save")<CR>
nnoremap <silent><space>e :call VSCodeCall("workbench.action.toggleSidebarVisibility")<CR>

nnoremap <C-a> G$vgg^

nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

nnoremap <space>r :call VSCodeNotify("code-runner.run")<CR>

nnoremap <space>ls :call VSCodeNotify("leetcode.submitSolution")<CR>
nnoremap <space>lS :call VSCodeNotify("leetcode.showSolution")<CR>
nnoremap <space>lt :call VSCodeNotify("leetcode.testSolution")<CR>
