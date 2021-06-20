call plug#begin('~/.vim/plugged')

if !exists('g:vscode')
      Plug 'neovim/nvim-lspconfig'
      Plug 'hrsh7th/nvim-compe'
      Plug 'preservim/nerdcommenter'
      Plug 'junegunn/fzf.vim'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'easymotion/vim-easymotion'
      Plug 'tpope/vim-surround'
      Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
      Plug 'voldikss/vim-floaterm'
      Plug 'ryanoasis/vim-devicons'
      Plug 'mhinz/vim-startify'
      Plug 'itchyny/lightline.vim'
      Plug 'dracula/vim', { 'as': 'dracula' }
else
      Plug 'tpope/vim-surround'
      Plug 'asvetliakov/vim-easymotion' , { 'as': 'vsc-easymotion'}
endif

call plug#end()

" ================================================================================= normal config
if !exists('g:vscode')
      "-------------------------------------------------------------- LSP config
      lua require("compe-config")
      lua require("python-config")
      lua require("js-config")
      lua require("efm-config")
      
      "--------------------------------------------------------------- General
      let mapleader = " "
      set number  relativenumber
      set clipboard+=unnamedplus " clipboard global
      set noshowmode      " hide Text in the command bar
      set tabstop=2       " The width of a TAB is set to 4.
      set shiftwidth=2    " Indents will have a width of 4
      set softtabstop=2   " Sets the number of columns for a TAB
      set expandtab       " Expand TABs to spaces

      "--------------------------------------------------------------- theme config
      if (has("termguicolors"))
       set termguicolors
      endif
      syntax enable
      colorscheme dracula
      let g:lightline = {'colorscheme': 'dracula'}
      "Transparent background
      hi Normal guibg=NONE ctermbg=NONE

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

" ================================================================================= VS CODE config
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
