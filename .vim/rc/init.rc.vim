" Initialize

set sh=zsh

let $DOTVIM = expand('~/.vim')
" Nvimでカーソルを|にしたい
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" set autochdir

set updatetime=250

" GitGutterマーク分を予め空けておく
set signcolumn=yes

set spelllang+=cjk
let mapleader = "\<Space>"
let maplocalleader = ','
" can't use <<
" no <Subleader> <Nop>
map \ <Subleader>
set ambiwidth=double
rv! " 履歴共有
set incsearch
" 最後改行勝手にいれない
set nofixeol
" ブランチ名をステータスラインに表示する
set laststatus=2
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P
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
set matchpairs+=『:』
set matchpairs+=【:】
set matchpairs+=（:）
set matchpairs+=≪:≫


let b:match_words = '\s*#\s*region.*$:\s*#\s*endregion'

set list
" set listchars=tab:\ \ ,eol:\ ,extends:»,precedes:« " 列折り返す際はこちらを使うとよいかも
set listchars=tab:\ \ ,eol:\ 
" set guifont=Ricty-Regular-for-Powerline:h16
" 列折り返す(nowrapで折り返さず列スクロールする)
set wrap

" ~(バックアップ)ファイル作成しない
set nobackup
set noswapfile
set nowritebackup
" セッションを超えたバックアップファイル作成しない(.un~)
set noundofile
" デフォルトを相対行数にする
" set relativenumber
set number
" 矩形をブロックにする
set virtualedit=block
" ビープ音ならさない
set vb t_vb=
" 挿入モードで文字消せない問題解決
set backspace=indent,eol,start

" set scrolloff=9999

" メタ文字として扱う文字を`magic`で指定(`.`,`*`,`$`,`^`,`[`などを`\`で前置なしでメタ文字として扱う)
" set magic
" メタ文字として扱う文字を`nomagic`で指定(`$`,`^`などを`\ `で前置なしでメタ文字として扱う)
" set nomagic " easymotion詰む

" include周りの設定
" let g:clang_c_options = '-std=c11'
" let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

" Search hit number
" nnoremap <expr> <Leader>/ _(":%s/<Cursor>/&/gn")

autocmd FileType cvs,svn,gitcommit setlocal spell spelllang=en_us

let g:matchup_matchpref = {}
let g:matchup_matchpref.vue = {'tagnameonly': 1}
let g:matchup_matchpref.html = {'tagnameonly': 1}

augroup SaveGroup
    autocmd!
    " 保存時空白ハイライト
    autocmd BufWritePre * highlight TrailingSpaces term=underline guibg=darkblue ctermbg=darkblue
    autocmd BufWritePre * match TrailingSpaces /\s\+$/
    " autocmd BufWritePre * call lightline#update()

    " git差分マーク
    if !has('gui_running')
      autocmd BufWritePost * GitGutter
    endif

    autocmd BufWritePre *.cs call Uncrustify('cs')
    " autocmd BufWritePre *.cs call OmniSharp#FixUsings()

    autocmd BufWritePre *.cpp call Uncrustify('cpp')
    autocmd BufWritePre *.hpp call Uncrustify('cpp')
    autocmd BufWritePre *.h call Uncrustify('cpp')

    " autocmd BufWritePre *.py call Autopep8()
    autocmd BufWritePre *.py :LspDocumentFormat

    " autocmd BufWritePre *.mm call Uncrustify('mm')

    autocmd BufWritePre *.swift call Uncrustify('swift')
    autocmd BufWritePre *.swift call SubMark()

    autocmd BufWritePre *.json call JsonPretty()

    autocmd BufWritePre *.js :Prettier<CR>
    " autocmd BufWritePre *.html :normal gg=G<CR>
augroup END

augroup ReadGroup
    autocmd!
    au BufRead * nnoremap <silent> <Leader>r :QuickRun -mode n<CR>
    au BufRead * vnoremap <silent> <Leader>r :QuickRun -mode v<CR>
augroup END

function! SaveGroupDelete() abort
  augroup SaveGroup
    autocmd!
  augroup END
endfunction
command! -bar SaveGroupDelete call SaveGroupDelete()

" augroup HoldCursorGroup
"     autocmd!
    " autocmd CursorHold * highlight TrailingSpaces term=underline guibg=darkblue ctermbg=darkblue
    " autocmd CursorHold * match TrailingSpaces /\s\+$/
    " autocmd CursorHold *.cs UnivimBuild
    " if has('gui_running')
      " autocmd CursorHold * call toggl#task_cache_update()
      " autocmd CursorHold * call lightline#update()
    " endif
" augroup END

" augroup CursorMovedGroup
"     autocmd!
"     autocmd CursorMoved * call tagbar#highlighttag(1, 1)
" augroup END

function! s:NoneFileTypeSetMarkdown()
  if len(&filetype) == 0
    set filetype=markdown
  endif
endfunction
autocmd BufEnter * call s:NoneFileTypeSetMarkdown()

augroup InsertLeaveGroup
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

augroup ExitExMode
  autocmd!
  autocmd BufWinLeave * hi CursorLine cterm=NONE ctermfg=NONE ctermbg=236
  autocmd BufWinLeave * set nocursorline
augroup END

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
