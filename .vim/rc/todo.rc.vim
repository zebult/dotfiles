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
  let l:line = getline('.')
  let l:firstWord = line[0]
  let l:secondWord = line[2]
  let l:thirdWord = line[4]
  let l:isFirstBullet = CheckBullet(firstWord)
  let l:isSecondBullet = CheckBullet(secondWord)
  let l:isThirdBullet = CheckBullet(thirdWord)

  if l:isSecondBullet == 1 && l:isThirdBullet == 1
    return 0
  end

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
      execute "normal! i- [ ] "
    else
      execute "normal! 0\"oylo\"opa "
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
