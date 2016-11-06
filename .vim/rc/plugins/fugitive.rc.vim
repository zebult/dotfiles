ca gst Gstatus
ca gad Gwrite
ca gcm Gcommit
ca gacm Gacm
ca gco Gread
ca gbl Gblame
ca glo Glog
ca gdf Gdiff
ca gbo Gbrowse
ca gfc Gfetch
ca gps Gpush
ca gr Ggrep
command! -nargs=0 Gacm call Gacm()
function! Gacm() abort
    Gwrite
    Gcommit
endfunction

" nnoremap gst  :Gstatus<Cr>
" nnoremap gad  :Gwrite<Cr>
" nnoremap gcm  :Gcommit<Cr>
" nnoremap gacm :Gwrite<Cr> :Gcommit<Cr>
" nnoremap gco  :Gread<Cr>
" nnoremap gbl  :Gblame<Cr>
" nnoremap glo  :Glog<Cr>
" nnoremap gdf  :Gdiff<Cr>
" nnoremap gbo  :Gbrowse<Cr>
" vnoremap gbo  :Gbrowse<Cr>
" nnoremap gfc  :Gfetch<Cr>
" nnoremap gps  :Gpush<Cr>
" nnoremap gr   :Ggrep
