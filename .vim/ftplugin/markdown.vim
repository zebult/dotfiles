set expandtab
" タブをスペース2にする
set ts=2 sw=2 sts=0
" o(O)を先頭に合わせる
nnoremap o :call Action_o()<CR>
nnoremap O :call Action_O()<CR>

nnoremap go o
nnoremap gO O

" todoリストを簡単に入力する
abbreviate tl -[ ]
" todoリストのon/offを切り替える
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

function! ToggleCheckbox() abort
    let l:line = getline('.')
    if l:line =~ '^\-\s\[\s\]'
        let l:result = substitute(l:line, '^-\s\[\s\]', '- [x]', '')
        call setline('.', l:result)
    elseif l:line =~ '^\-\s\[x\]'
        let l:result = substitute(l:line, '^-\s\[x\]', '- [ ]', '')
        call setline('.', l:result)
    end
endfunction

function! IsBullet() abort
    let l:firstWord = getline('.')[0]
    let l:secondWord = getline('.')[2]
    let l:thirdWord = getline('.')[4]
    let l:isFirstBullet = CheckBullet(firstWord)
    let l:isSecondBullet = CheckBullet(secondWord)
    let l:isThirdBullet = CheckBullet(thirdWord)
    if l:isFirstBullet == 1 || l:isSecondBullet == 1 || l:isThirdBullet == 1
        return 1
    end
endfunction

function! CheckBullet(word) abort
    if a:word =~ '[\*\-\>]'
        return 1
    end
    return 0
endfunction

function! IsTodo() abort
    let l:headWord = getline('.')[0]
    " let l:secondWord = getline('.')[2]
    " if l:headWord == '-' && l:secondWord == '['
    if l:headWord == '-'
        return 1
    end
    return 0
endfunction

function! Action_o() abort
    if IsBullet()
        execute "normal! $aa\"ox"
    else
        execute "normal! o"
    end
    if IsTodo()
        execute "normal! i [ ]"
    end
    startinsert!
endfunction

function! Action_O() abort
    if IsBullet()
        execute "normal! 0\"oylO\"opa "
    else
        execute "normal! O"
    end
    if IsTodo()
        execute "normal! i [ ]"
    end
    startinsert!
endfunction
