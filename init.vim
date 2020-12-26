"--------------------------------------------------------------- plugin 
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

call plug#end()
"--------------------------------------------------------------- Initialize plugin system

let mapleader = "\<Space>"



"--------------------------------------------------------------- theme config
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

"--------------------------------------------------------------- NERTtree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <leader>e :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"---------------------------------------------------------------- terminal
noremap  <leader><leader>  :FloatermToggle<CR>
noremap  <leader>t  :FloatermNew<CR>
noremap  <leader><leader>  <Esc>:FloatermToggle<CR>
tnoremap <leader><leader>  <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader><Tab>  <C-\><C-n>:FloatermNext<CR>

"--------------------------------------------------------------- window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
inoremap jh <Esc>
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

"--------------------------------------------------------------- GIT
set number  relativenumber
