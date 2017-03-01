let g:syntastic_cpp_compiler_options = '-std=c++11'

let $VIM_CPP_STDLIB = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"
let $COCOS_ROOT = "/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1"
let $BOOST_ROOT = "/usr/local/Cellar/boost/1.62.0/include"
" let $VIM_CPP_INCLUDE_DIR = $COCOS_ROOT . "/usr/local/Cellar/boost/1.62.0"
" インクルードパスを設定する(gfなどでヘッダーファイルを開ける)
" setlocal path+=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1/cocos/**
" setlocal path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1

" gfで飛ぶためのpath
function! s:add_path(path)
    if isdirectory(a:path)
        execute "set path+=".a:path
    endif
endfunction

call s:add_path($BOOST_ROOT)
call s:add_path($COCOS_ROOT)

setlocal shiftwidth=4

" 最後に定義された include 箇所へ移動してを挿入モードへ
nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

" BOOST_PP_XXX 等のハイライトを行う
syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
highlight link boost_pp cppStatement

" quickrun.vim の設定
let b:quickrun_config = {
\		"hook/add_include_option/enable" : 1
\	}

" 以下cocos pluginにする
" cppでディレクリ内にcocos2dがあったら
" setlocal path+=~/cocos2d/cocos/cocos2d.h
