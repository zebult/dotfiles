if expand("%:t") =~ ".*\.go"
    autocmd BufNewFile,BufRead *.go set filetype=go
    let g:go_fmt_command = "goimports"
    au BufWritePre *.go :GoFmt

    set runtimepath+=$GOROOT/misc/vim
    filetype plugin indent on
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
    set completeopt=menu,preview
endif
