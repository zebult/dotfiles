" 1. curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
" 2. sh ./install.sh
" 3. mkdir -p ~/.vim/bundle
" 4. git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" 7. cp このファイル ~/.vimrc
" - Powerline for ricty
"   $ brew tap sanemat/font
"   $ brew install --powerline --vim-powerline ricty
" - iTerm setting
"   Preferences > Profiles > Text
"   Regular FontとNon-ASCII Fontから設定できるよ
"   Regular FontのFontSizeをNon-ASCII Fontより2point大きく設定するといい感じのバランス
"
" プラグイン設定
" NeoBundle が無ければインストール
if !isdirectory(expand('$HOME/.vim/bundle'))
  call system('mkdir -p $HOME/.vim/bundle')
  call system('git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim')
  source $HOME/.vimrc
  NeoBundleInstall
  q
endif

 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif
" Vim 起動時のみ実行
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
  " NeoBundle 自体を NeoBundle で管理
 NeoBundleFetch 'Shougo/neobundle.vim'
  " Vim上でデータを操作するためのインターフェース
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'flazz/vim-colorschemes'
  " Uniteを利用してカラースキーム一覧表示を行う(:Unite colorscheme -auto-preview)
 NeoBundle 'ujihisa/unite-colorscheme'
  " VimScriptで作ってあるshell
 NeoBundle 'Shougo/vimshell.vim'
 NeoBundle 'Shougo/vimproc'
  " VimShellでssh
 NeoBundle 'ujihisa/vimshell-ssh'
 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

 colorscheme zenburn
 set nu
 " set guifont=Ricty-Regular-for-Powerline:h14 
 noremap j gj
 noremap k gk
 syntax on
 inoremap jj <ESC><ESC><ESC> 
 set clipboard+=unnamed
 set autoindent
 set tabstop=3
 set expandtab
" Screen split key mappings
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
