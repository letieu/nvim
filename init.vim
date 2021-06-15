"--------------------------------------------------------------- plugin 
call plug#begin('~/.vim/plugged')

if !exists('g:vscode')
      Plug 'preservim/nerdcommenter'
      Plug 'junegunn/fzf.vim'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'easymotion/vim-easymotion'
      Plug 'tpope/vim-surround'
      Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
      Plug 'pangloss/vim-javascript'
      Plug 'preservim/tagbar'
      Plug 'voldikss/vim-floaterm'
      Plug 'udalov/javap-vim'
      Plug 'neoclide/coc.nvim', {'branch': 'release'}
      Plug 'ryanoasis/vim-devicons'
      Plug 'mhinz/vim-startify'
      Plug 'itchyny/lightline.vim'
      Plug 'dracula/vim', { 'as': 'dracula' }
else
      Plug 'tpope/vim-surround'
      Plug 'neoclide/coc.nvim', {'branch': 'release'}
      Plug 'asvetliakov/vim-easymotion' , { 'as': 'vsc-easymotion'}
endif


call plug#end()



if !exists('g:vscode')
      "--------------------------------------------------------------- General
      let mapleader = "\<Space>"
      "let g:javascript_plugin_jsdoc = 1 " endable doc
      set number  relativenumber
      set clipboard+=unnamedplus " clipboard global
      set noshowmode      " hide Text in the command bar

      set tabstop=2       " The width of a TAB is set to 4.
                          " Still it is a \t. It is just that
                          " Vim will interpret it to be having
                          " a width of 4.

      set shiftwidth=2    " Indents will have a width of 4

      set softtabstop=2   " Sets the number of columns for a TAB

      set expandtab       " Expand TABs to spaces

      "--------------------------------------------------------------- theme config
      if (has("termguicolors"))
       set termguicolors
      endif
      syntax enable
      colorscheme dracula
      let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ }

      "Set lightline transparent
      let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
      let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
      let s:palette.inactive.middle = s:palette.normal.middle
      let s:palette.tabline.middle = s:palette.normal.middle

      "Transparent background
      hi Normal guibg=NONE ctermbg=NONE

      "Split line

      "--------------------------------------------------------------- NERTtree config
      let g:NERDTreeShowHidden = 1
      let g:NERDTreeMinimalUI = 1
      let g:NERDTreeIgnore = []
      let g:NERDTreeStatusline = ''
      " Open the existing NERDTree on each new tab.
      autocmd BufWinEnter * silent NERDTreeMirror
      nnoremap <leader>e :NERDTreeToggle<CR>


      "---------------------------------------------------------------- terminal
      noremap  <leader>t  :FloatermToggle<CR>
      noremap  <leader>T         :FloatermNew<CR>
      noremap  <leader><leader>  <Esc>:FloatermToggle<CR>
      tnoremap <leader><leader>  <C-\><C-n>:FloatermToggle<CR>
      tnoremap <leader><Tab>  <C-\><C-n>:FloatermNext<CR>

      let g:floaterm_height = 34
      let g:floaterm_width = 150
      let g:floaterm_title = ''

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


      "------------------------------------------------------------------------------ FZF search
      let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
      noremap  <leader>p :Files<CR>
      noremap  <leader>P :Ag<CR>


      "------------------------------------------------------------------------------ Easymotion
      nmap s <Plug>(easymotion-overwin-f2)


      "------------------------------------------------------------------------------- TAB
      noremap <leader>1 1gt
      noremap <leader>2 2gt
      noremap <leader>3 3gt
      noremap <leader>4 4gt
      noremap <leader>5 5gt
      noremap <leader>6 6gt
      noremap <leader>7 7gt
      noremap <leader>8 8gt
      noremap <leader>9 9gt
      noremap <leader>0 :tablast<cr>

      "------------------------------------------------------------------------------- Starify
      let g:startify_bookmarks = [
                  \ { 'Vim-config': '~/.config/nvim/' },
                  \ { 'Adflex-dropship': '~/tt_adflex/opc/src' },
                  \ { 'Adflex-cpo': '~/tt_adflex/cpo/src' },
                  \ { 'Adflex-report': '~/tt_adflex/report/src' },
                  \ { 'Fun-invoice': '~/tt_fun/sigma-vue' },
                  \ ]
      let g:startify_lists = [
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': 'files',     'header': ['   Files']            },
                \ ]

else
      map s <Plug>(easymotion-bd-f2)

      " window navigation
      
      nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
      xnoremap <C-> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
      nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
      xnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
      nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
      xnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
      nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
      xnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

endif
