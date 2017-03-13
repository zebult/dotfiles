" Initialize:

let $DOTVIM = expand('~/.vim')
let mapleader = "\<Space>"
set ambiwidth=double
rv! " 履歴共有
set incsearch
" 最後改行勝手にいれないはず
set nofixeol
" ブランチ名をステータスラインに表示する
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P
set history=200
set whichwrap=h,l
" インデントをスペース(4つ)だけにする "
set ts=4 sw=4 sts=0
" 検索時大文字小文字を区別しない
set ignorecase
" 大文字混在時は大文字小文字区別する
set smartcase
"タブをスペースに
set expandtab
"インデントを自動でつける
set autoindent
" 検索をファイルの先頭へループしない
" set nowrapscan
" buffer切り替え時ファイルを保存しなくてもよい
set hidden
" 補完時に大文字小文字を区別しない
set infercase
" Tab complete for command line mode
set wildmenu wildmode=list:full
" インデントを自動でつける
set autoindent
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" 対応括弧に'<'と'>'のペアを追加
set matchpairs+=<:>
set matchpairs+=｛:｝
set matchpairs+=「:」
set matchpairs+=【:】
set matchpairs+=（:）
" ~(バックアップ)ファイル作成しない
set nobackup
set noswapfile
set nowritebackup
" セッションを超えたバックアップファイル作成しない(.un~)
set noundofile
" デフォルトを相対行数にする
set relativenumber
set number
" 矩形をブロックにする
set virtualedit=block
" ビープ音ならさない
set vb t_vb=
" 挿入モードで文字消せない問題解決
set backspace=indent,eol,start

" include周りの設定
" let g:clang_c_options = '-std=c11'
" let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

" clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Search hit number
nnoremap <expr> <Leader>/ _(":%s/<Cursor>/&/gn")

function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

" vimdiff
function Diff()
    :tabne
    :edit OLD
    :setlocal scrollbind
    :rightbelow vnew NEW
    :setlocal scrollbind
endfunction

" abbreviate
abbreviate TT // TODO:

" original function
source ~/Dropbox/Saichi/Vim/Macros/sedItem.vim
source ~/Dropbox/Saichi/Vim/Macros/cleanSpace.vim

augroup SaveGroup
    autocmd!
    " 保存時Git差分ハイライト
    " autocmd BufWritePre * :GitGutterLineHighlightsEnable
    " 保存時空白ハイライト
    autocmd BufWritePre * highlight TrailingSpaces term=underline guibg=darkblue ctermbg=darkblue
    autocmd BufWritePre * match TrailingSpaces /\s\+$/
augroup END

" 無限undo
if has('persistent_undo')
	set undodir=~/.vimundo
	set undofile
endif

" 最後のカーソル位置を復元する
augroup UtilitiesGroup
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
augroup END
