if expand("%:t") =~ ".*\.md"
    " タブをスペース2にする
    set ts=2 sw=2 sts=0
    " todoリストを簡単に入力する
    abbreviate tl - [ ]
    " todoリストのon/offを切り替える
    nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

    function! ToggleCheckbox()
        let l:line = getline('.')
        if l:line =~ '^\-\s\[\s\]'
            let l:result = substitute(l:line, '^-\s\[\s\]', '- [x]', '')
            call setline('.', l:result)
        elseif l:line =~ '^\-\s\[x\]'
            let l:result = substitute(l:line, '^-\s\[x\]', '- [ ]', '')
            call setline('.', l:result)
        end
    endfunction
endif
