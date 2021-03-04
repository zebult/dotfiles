" deopleteを有効化
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_yarp = 1
" call deoplete#custom#option('deoplete-options-yarp', v:true)
" let g:deoplete#auto_complete_delay = 0

" 補完候補提示の際に先頭を選択状態へ
set completeopt+=noinsert

set rtp+=$HOME/.cache/dein/repos/github.com/Shougo/deoplete.nvim

" use zchee/deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header  = '/Library/Developer/CommandLineTools/usr/lib/clang'

" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclapack.dylib'
" let g:deoplete#sources#clang#libclang_path = '/usr/lib'
" let g:deoplete#sources#clang#clang_header = '/usr/lib'
" let g:deoplete#sources#clang#clang_header = '/usr/bin/clang'
" let g:deoplete#sources#clang#clang_header = '/usr/include'
" let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
" let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
" let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

" オムニ補完を対象にする
" if !exists("g:deoplete#omni#input_patterns")
"   let g:deoplete#omni#input_patterns = {}
" endif
" " clang family omnicomplete
" let g:deoplete#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:deoplete#omni#input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:deoplete#omni#input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 補完候補閉じる
" inoremap <expr><C-e> deoplete#cancel_popup()

" 補完候補確定
" inoremap <expr><C-y> deoplete#close_popup()
" inoremap <expr><CR>  pumvisible() ? "\<C-y>"  : "\<CR>"
" inoremap <expr><Tab> pumvisible() ? "\<C-n>"  : "\<Tab>"
" inoremap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-x>\<C-o>"

" 自動補完on/off
" inoremap jn <ESC>:NeoCompleteToggle<CR>a
