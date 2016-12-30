ca gst Gstatus
ca gad Gwrite
ca gcm Gcommit
ca gacm Gacm
ca gco Gread
ca gbl Gblame
ca glo Glog
ca gdf Gdiff
ca gop Gbrowse
ca gfc Gfetch
ca gps Gpush
ca gpl Gpull
ca gr Ggrep
command! -nargs=0 Gacm call Gacm()
function! Gacm() abort
    Gwrite
    Gcommit
endfunction
