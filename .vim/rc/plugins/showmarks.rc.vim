" http://blog.calcurio.com/vim_mark.html

" nnoremap mm :NoShowMarks!<CR>:DoShowMarks!<CR>

" 基本マップ
nnoremap [Mark] <Nop>
nmap m [Mark]

" 最初からマークを表示する
aug show-marks-sync
  au!
  au BufReadPost * sil! DoShowMarks
aug END

if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif

for char in g:markrement_char
  execute 'nnoremap [Mark]'.char.' m'.char.':DoShowMarks!<CR>'
endfor

nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction
