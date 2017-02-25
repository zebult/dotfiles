augroup vimrc-set_filetype
    autocmd!
    filetype plugin indent on
    au BufRead,BufNewFile *.cpp set filetype=cpp
    au BufRead,BufNewFile *.mm set filetype=objc
    au BufRead,BufNewFile *.m set filetype=objc
    au BufRead,BufNewFile *.java set filetype=java
    au BufRead,BufNewFile *.swift set filetype=swift
    au BufRead,BufNewFile *.md set filetype=markdown
    au BufRead,BufNewFile *.py set filetype=python
    au BufRead,BufNewFile *.cs set filetype=cs
    au BufRead,BufNewFile *.go set filetype=go
    au BufRead,BufNewFile *.js set filetype=javascript
    au BufRead,BufNewFile *.strace set filetype=strace
    " c++標準ライブラリへのパスを設定
    let $CPP_STDLIB = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"
    " $CPP_STDLIB よりも下の階層のファイルが開かれて
    " filetype が設定されていない場合に filetype=cpp を設定する
    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END
