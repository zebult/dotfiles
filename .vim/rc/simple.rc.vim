" dein.vim {{{
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('zchee/deoplete-clang')
call dein#add('thinca/vim-quickrun')
call dein#add('kana/vim-smartinput')
call dein#add('itchyny/lightline.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Yggdroot/indentLine')
call dein#add('airblade/vim-gitgutter')
call dein#add('thinca/vim-template')

" colorscheme
call dein#add('vim-scripts/Wombat')

" }}}

" thinca/vim-quickrun {{{
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
let g:quickrun_config.cpp = {
  \   'command': 'g++',
  \   'cmdopt': '-std=c++11'
  \ }

"}}}
" Shougo/deoplete.nvim {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_smart_case = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

augroup cpp-path
  autocmd!
  "autocmd FileType cpp setlocal path=.,/usr/include/c++/4.8/,/usr/include/x86_64-linux-gnu/c++/4.8,/usr/include/c++/4.8/backward,/usr/lib/gcc/x86_64-linux-gnu/4.8/include,/usr/local/include/,/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed,/usr/include/x86_64-linux-gnu,/usr/include
  autocmd FileType cpp setlocal path=.,/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1,/usr/include
augroup END

" }}}
" zchee/deoplete-clang {{{
let g:syntastic_cpp_compiler_options = ' -std=c++1y'
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header  = '/Library/Developer/CommandLineTools/usr/lib/clang'

"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.4/lib/libclang.so.1'
"let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

"}}}
