" filetype=cpp が設定された時に呼ばれる関数
" Vim で C++ の設定を行う場合はこの関数内で記述する
" function! s:cpp()
"
" インクルードパスを設定する
" gf などでヘッダーファイルを開きたい場合に影響する
setlocal path+=D:/home/cpp/boost,D:/home/cpp/sprout

"タブ文字の長さ
setlocal tabstop=4
setlocal shiftwidth=4

" 空白文字ではなくてタブ文字を使用する
setlocal noexpandtab

" 最後に定義された include 箇所へ移動してを挿入モードへ
nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

" BOOST_PP_XXX 等のハイライトを行う
syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
highlight link boost_pp cppStatement

" ライブラリパス設定
augroup cpp_path
    autocmd!
    autocmd FileType cpp setlocal path+=.,/usr/include,/usr/local/include
augroup END

