" autocmd FileType markdown inoremap <buffer> <expr> - smartchr#loop('- ', '-')
inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' == ')
inoremap <buffer> <expr> + smartchr#loop('+', ' + ', ' += ')
inoremap <buffer> <expr> - smartchr#loop('-', ' - ', ' -= ')
inoremap <buffer> <expr> , smartchr#loop(', ', ',')
inoremap <buffer> <expr> : smartchr#loop(':', ': ', '::')
inoremap <buffer> <expr> ! smartchr#loop('!', ' != ')
inoremap <buffer> <expr> { smartchr#loop('{', ' {<CR>}')

