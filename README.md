
<div style='display: flex; justify-content: space-between'>
<img src='https://github.com/letieu/nvim/blob/master/images/1.png?raw=true' width='800px'/>
<img src='https://github.com/letieu/nvim/blob/master/images/2.png?raw=true' width='400px'/>
<img src='https://github.com/letieu/nvim/blob/master/images/3.png?raw=true' width='400px'/>
</div>

# INSTALL
Use vim with alacritty terminal is the best couple

1. install [neovim](https://neovim.io)
2. (Optional) install [alacritty](https://github.com/alacritty/alacritty) terminal and create config [file](https://github.com/letieu/nvim/blob/master/alacritty.yml) in `~/.config/alacritty/alacritty.yml`
3. config: 
```
rm -rf ~/.config/nvim

git clone https://github.com/letieu/nvim.git ~/.config/nvim

nvim +PluginInstall
```
# PLUGIN INSTALLED
``` 
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"Plug 'fatih/molokai'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
```
# KEYMAP
## tab move: 
```
t             :  open new tab from NERD tree
<Space> 1,2,3 : swicth tab
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
<C-Up, Down.. >   : resize
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

## coc🆑 :
```
gd:           : go to define
gy:           : go to type, interface
gK:           : document view
```

## Find (easymotion, fzf)💿 :
```
s             : s{char}{char}
<Space>p      : find all file
:Ag           : Find word in all folder
```
## Multil cusor📠 : 
```
<C-n>         : Select word, find next
<C-x>, <C-p>  : remove, back 
<A-n>         : Select all
```
