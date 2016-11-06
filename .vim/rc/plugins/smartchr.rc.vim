inoremap <buffer> <expr> = smartchr#loop('=', '==', '+=', '-=')
inoremap <buffer> <expr> + smartchr#loop('+', '++', '+=')
inoremap <buffer> <expr> - smartchr#loop('-', '--', '-=')
inoremap <buffer> <expr> * smartchr#loop('*', '**')
inoremap <buffer> <expr> , smartchr#loop(', ', '←', '↓', '↑', '→')
inoremap <buffer> <expr> : smartchr#loop(': ', '::')
inoremap <buffer> <expr> ! smartchr#loop('!', '!=')
inoremap <buffer> <expr> { smartchr#loop('{', ' {<CR>}')
inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
inoremap <buffer> <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('#define', '#include', '#ifdef', '#endif', '@'): '@'
inoremap <buffer> <expr> - search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('- ', '-'): '-'
inoremap <buffer> <expr> * search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('* ', '*'): '*'
" autocmd FileType markdown inoremap <buffer> <expr> - smartchr#loop('- ', '-')
" autocmd FileType markdown inoremap <buffer> <expr> * smartchr#loop('* ', '*')
