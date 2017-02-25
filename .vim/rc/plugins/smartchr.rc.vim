autocmd FileType * inoremap <buffer> <expr> = smartchr#loop('=', '==', '+=', '-=')
autocmd FileType * inoremap <buffer> <expr> + smartchr#loop('+', '++', '+=')
autocmd FileType * inoremap <buffer> <expr> - smartchr#loop('-', '--', '-=')
autocmd FileType * inoremap <buffer> <expr> * smartchr#loop('*', '**')
autocmd FileType * inoremap <buffer> <expr> , smartchr#loop(', ', '→', '←', '↑', '↓')
" autocmd FileType * inoremap <buffer> <expr> : smartchr#loop(':', '::')
autocmd FileType * inoremap <buffer> <expr> ! smartchr#loop('!', '!=', '!!')
autocmd FileType * inoremap <buffer> <expr> ) smartchr#loop(')', ')<Left>')
autocmd FileType * inoremap <buffer> <expr> ] smartchr#loop(']', ']<Left>')
autocmd FileType * inoremap <buffer> <expr> > smartchr#loop('>', '><Left>')
autocmd FileType * inoremap <buffer> <expr> " smartchr#loop('"', '""', '""<Left>')
" autocmd FileType * inoremap <buffer> <expr> ' smartchr#loop("'", "''", "''<Left>")
autocmd FileType * inoremap <buffer> <expr> { smartchr#loop('{', ' {<Cr>}<Left><Cr><Up><Tab>')
autocmd FileType javascript inoremap <buffer> <expr> { smartchr#loop('{', ' {<Cr>},<Left><Left><Cr><Up><Tab>')
autocmd FileType * inoremap <buffer> <expr> ; smartchr#loop(';', ';<Left><Left>')
autocmd FileType * inoremap <buffer> <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('#include', '#define', '#ifdef', '#endif', '@'): '@'
autocmd FileType * inoremap <buffer> <expr> - search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('- ', '-'): '-'
autocmd FileType * inoremap <buffer> <expr> * search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('* ', '*'): '*'
autocmd FileType cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '..')
" autocmd FileType markdown inoremap <buffer> <expr> - smartchr#loop('- ', '-')
" autocmd FileType markdown inoremap <buffer> <expr> * smartchr#loop('* ', '*')

