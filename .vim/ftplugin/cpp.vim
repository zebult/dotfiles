let g:syntastic_cpp_compiler_options = '-std=c++11'
" インクルードパスを設定する(gfなどでヘッダーファイルを開ける)
" setlocal include+=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.6/cocos/**
setlocal path+=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.6/cocos/**
" setlocal path+=/usr/local/Cellar/boost
setlocal path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
" setlocal path+=/usr/include/c++/4.2.1
" setlocal path+=/usr/local/include
let $VIM_CPP_INCLUDE_DIR = "/Applications/Cocos/Cocos2d-x/cocos2d-x-3.6/cocos"
" tab is space 4
setlocal shiftwidth=4
" 最後に定義された include 箇所へ移動してを挿入モードへ
nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o
" BOOST_PP_XXX 等のハイライトを行う
syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
highlight link boost_pp cppStatement

set dictionary=~/.vim/dict/cpp.dict
" 以下cocos pluginにする
" cppでディレクリ内にcocos2dがあったら
" setlocal path+=~/cocos2d/cocos/cocos2d.h
