" http://wakame.hatenablog.jp/entry/2017/05/03/222511

" add      : -
" patch    : p
" diff     : D
" checkout : U

let g:netrw_browsex_viewer = 'open'

ca gst Gstatus
ca gad Gwrite
ca gcm Gcommit
ca gco Gread
ca gbl Gblame
ca glo Glog
ca gdf Gdiff
ca gop Gbrowse
ca gfc Gfetch
ca gps Gpush
ca gpl Gpull
ca gr Ggrep

function! Gacm() abort
    Gwrite
    Gcommit
endfunction
command! -nargs=0 Gacm call Gacm()

nnoremap <Leader>gs :Gstatus<CR><C-w>o
