" autoload
function! g:Sample() abort
    " echo "ouch"
    " execute "!open ."
    " :!open .
    :!open `find . -name *.xcworkspace`
endfunction

" plugin
nnoremap <silent> ;s :call g:Sample()<CR>

