function! s:format_param(word, num)
  let w = a:word
  while strlen(w) < a:num
    let w = w . ' '
  endwhile
  return w
endfunction

let a = s:format_param('ouch', 6)
