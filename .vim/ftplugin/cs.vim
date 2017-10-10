" setlocal tabstop=4
setlocal shiftwidth=4

" 空白文字ではなくてタブ文字を使用する
" setlocal noexpandtab

" Log
nnoremap gl yiwoDebug.Log("p:" + p);
vnoremap gl yoDebug.Log("p:" + p);

augroup cs_groupe
    autocmd!
    autocmd FileType cs set omnifunc=OmniSharp#Complete
augroup END
