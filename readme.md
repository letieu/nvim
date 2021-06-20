# INSTALL
Use vim with alacritty terminal is the best couple

1. install [neovim](https://neovim.io)

2. config: 
```
mv ~/.config/nvim ~/.config/nvim.old

git clone https://github.com/letieu/nvim.git ~/.config/nvim
```
* install Vim-plug

* `nvim +PlugInstall`

* `:checkhealth` , fix errors, install some dependency for python, node provider, Lsp-server

* for VScode:

      * install vscode-neovim

      * config bin PATH for neovim

# PLUGIN INSTALLED
``` 
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
```
# KEYMAP
## tab move: 
```
t             :  open new tab from NERD tree
<Space> 1,2,3 : swicth tab
<C-t>         : open new tab from Fzf file search (<Space-p>)
```
## termial💴 :
```
<Space> t: Toggle termial
<Space> T     : New tab terminal
<Space><Tab>  : Switch terminal
<Space><Space>: Close terminal
```
## general🈂 :
```
jf:               : Esc
<C-Up, Down.. >   : scroll
<Space> c <Space> : comment
zc, zo            : fold method, open method
```
## nerdtree🐱 :
```
<Space> e     : toggle
m             : show menu
s             : open split | 
i             : split ---
t             : open in new tab
```

## lsp-config :
```
gd, gD, gi    : go to define, declaration, implement
gr:           : view list references in file
K, <C-k>      : description, paramaters info

<space>ca     : code action
<space>rn     : rename
<space>f      : format
```

## Find (easymotion, fzf)💿 :
```
s             : s{char}{char}
<Space>p      : find all file
<Space>P      : file all project (Ag or Rg)
:Ag           : Find word in all folder
:Rg           : like Ag
```

## Vim surround✌ :
```
cs " '        : change "abc" to 'abc'
```
