 "--------------------------------------------------------------- plugin 
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

call plug#end()


"--------------------------------------------------------------- General
let mapleader = "\<Space>"
let g:javascript_plugin_jsdoc = 1
set number  relativenumber
set clipboard+=unnamedplus
set noshowmode
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces


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
inoremap jf <Esc>
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>


"--------------------------------------------------------------- COC SERVER
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


"------------------------------------------------------------------------------ FZF search
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
nnoremap  <leader>p :Files<CR>


"------------------------------------------------------------------------------ Easymotion
nmap s <Plug>(easymotion-overwin-f2)


"------------------------------------------------------------------------------ FOLDING
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
