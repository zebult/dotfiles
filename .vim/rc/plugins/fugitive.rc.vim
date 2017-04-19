let g:netrw_browsex_viewer = 'open'
" add toggle: -, add patch toggle: p
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

nnoremap <Leader>S :Gstatus<CR><C-w>o
