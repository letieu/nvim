call plug#begin('~/.vim/plugged')

if !exists('g:vscode')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
    Plug 'lukas-reineke/indent-blankline.nvim', {'branch' : 'lua'}
    Plug 'voldikss/vim-floaterm'
    Plug 'ryanoasis/vim-devicons'
    Plug 'mhinz/vim-startify'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'ray-x/lsp_signature.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'kyazdani42/nvim-tree.lua'
else
    Plug 'tpope/vim-surround'
    Plug 'asvetliakov/vim-easymotion' , { 'as': 'vsc-easymotion'}
endif

call plug#end()

" ================================================================================= normal config
if !exists('g:vscode')
    let mapleader = " "
    lua require("keymap")

    "-------------------------------------------------------------- new Lua config plugins
    lua require("plugins/compe-config")
    lua require("plugins/tree")
    lua require("plugins/tabline")
    lua require("plugins/statusline")
    lua require("plugins/treesitter-config")
    lua require("lsp_signature").on_attach()

    "-------------------------------------------------------------- LSP config
    lua require("lsp/python-config")
    lua require("lsp/lua-config")
    lua require("lsp/js-config")
    lua require("lsp/php-config")
    lua require("lsp/efm-config")
    lua require("lsp/c-config")

    "--------------------------------------------------------------- general
    set number  relativenumber
    set clipboard+=unnamedplus " clipboard global
    set tabstop=4       " the width of a tab is set to 4.
    set shiftwidth=4    " indents will have a width of 4
    set softtabstop=4   " sets the number of columns for a tab
    set expandtab       " expand tabs to spaces
    filetype plugin indent on

    "--------------------------------------------------------------- theme config
    if (has("termguicolors"))
    set termguicolors
    endif
    syntax enable
    colorscheme dracula


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
    noremap  <leader>P :Rg<CR>


    "------------------------------------------------------------------------------ Easymotion
    nmap s <Plug>(easymotion-overwin-f2)


    " ------------------------------------------------------------------------treesitter
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()

    "------------------------------------------------------------------------------- compe
    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <M-j> compe#confirm('<CR>')

    "------------------------------------------------------------------------------- Starify
    let g:startify_bookmarks = [
              \ { 'Vim-config': '~/.config/nvim/' },
              \ ]
    let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',     'header': ['   Files']            },
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



" -----------------
"  GUI - Settings
" -----------------
set guifont=Fira\ Code\ Light:h10
let g:neovide_fullscreen=v:true
