set expandtab
" タブをスペース2にする
set ts=2 sw=2 sts=0
" メモ取りやすくする
inoremap <S-Tab> <Left><Left><backspace><Right><Right>
inoremap g<Tab> <Left><Left><tab><Right><Right>
" o(O)を先頭に合わせる
nnoremap o :call Action_o()<CR>
nnoremap O :call Action_O()<CR>

nnoremap go o
nnoremap gO O

" todoリストを簡単に入力する
" abbreviate tl -[ ]xxa " cohama/lexima.vim
abbreviate tl -[ ]

abbreviate gl ## Today's goal

" todoリストのon/offを切り替える
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

let s:bullet_word = "'[\*\-\>]'"

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
  return 0
endfunction

function! CheckBullet(word) abort
  " execute "if a:word =~ ".s:bullet_word
  if a:word =~ '[\*\-\>]'
    return 1
  end
  return 0
endfunction

function! IsTodo() abort
  let l:headWord = getline('.')[0]
  let l:secondWord = getline('.')[2]
  " echo secondWord
  if l:headWord == '-' && l:secondWord == '['
  " if l:headWord == '-'
    return 1
  end
  return 0
endfunction

function! Action_o() abort
  if IsBullet()
    if IsTodo()
      execute "normal! $aa\"ox"
      execute "normal! i [ ]"
    else
      execute "normal! $aa\"ox"
    end
  else
    execute "normal! o"
  end
  startinsert!
endfunction

function! Action_O() abort
  if IsBullet()
    if IsTodo()
      execute "normal! 0\"oylO\"opa "
      execute "normal! i [ ]"
    else
      execute "normal! 0\"oylO\"opa "
    end
  else
    execute "normal! O"
  end
  startinsert!
endfunction

au FileType markdown syn region myMkdHeaderFold
        \ start="\v^\s*\z(\#{1,6})"
        \ skip="\v(\n\s*\z1\#)\@="
        \ end="\v\n(\s*\#)\@="ms=s-1,me=s-1
        \ fold contains=myMkdHeaderFold

au FileType markdown syn sync fromstart
au FileType markdown set foldmethod=syntax
