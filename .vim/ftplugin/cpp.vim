let g:syntastic_cpp_compiler_options = '-std=c++11'

let $VIM_CPP_STDLIB = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"
let $VIM_CPP_INCLUDE_DIR = "/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1/cocos,/usr/local/Cellar/boost/1.62.0"
" インクルードパスを設定する(gfなどでヘッダーファイルを開ける)
" setlocal path+=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1/cocos/**
" setlocal path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
"
setlocal shiftwidth=4

" 最後に定義された include 箇所へ移動してを挿入モードへ
nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

" BOOST_PP_XXX 等のハイライトを行う
syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
highlight link boost_pp cppStatement

" インクルードパスを設定する
" gf などでヘッダーファイルを開きたい場合に影響する
let &l:path = join(filter(split($VIM_CPP_STDLIB . "," . $VIM_CPP_INCLUDE_DIR, '[,;]'), 'isdirectory(v:val)'), ',')

" quickrun.vim の設定
let b:quickrun_config = {
\		"hook/add_include_option/enable" : 1
\	}

" 以下cocos pluginにする
" cppでディレクリ内にcocos2dがあったら
" setlocal path+=~/cocos2d/cocos/cocos2d.h
