autocmd FileType *          inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' == ', ' != ')
autocmd FileType *          inoremap <buffer> <expr> + smartchr#loop('+', ' + ', '++', ' += ')
autocmd FileType *          inoremap <buffer> <expr> - smartchr#loop('-', '--', ' -= ')
autocmd FileType markdown   inoremap <buffer> <expr> - search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('- ', '-'): '-'
autocmd FileType *          inoremap <buffer> <expr> * smartchr#loop('*', '*= ')
autocmd FileType markdown   inoremap <buffer> <expr> * search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('* ', '*'): '*'
autocmd FileType *          inoremap <buffer> <expr> , smartchr#loop(', ', '→', '←', '↑', '↓')
autocmd FileType cpp,h,hpp  inoremap <buffer> <expr> , smartchr#loop(', ', ' -> ')
autocmd FileType cs  inoremap <buffer> <expr> , smartchr#loop(', ', ' => ')
" autocmd FileType *          inoremap <buffer> <expr> " smartchr#loop('"', '""', '""<Left>')
" autocmd FileType *          inoremap <buffer> <expr> ' smartchr#loop("'", "''", "''<Left>")
" autocmd FileType *          inoremap <buffer> <expr> ( smartchr#loop('(', '()<Left><Left>')
" autocmd FileType *          inoremap <buffer> <expr> ) smartchr#loop(')', ')<Left>')
" autocmd FileType *          inoremap <buffer> <expr> [ smartchr#loop('[', '[]<Left>')
" autocmd FileType *          inoremap <buffer> <expr> ] smartchr#loop(']', ']<Left>')
" autocmd FileType *          inoremap <buffer> <expr> < smartchr#loop('<', '<><Left>')
" autocmd FileType *          inoremap <buffer> <expr> > smartchr#loop('>', '><Left>')
" autocmd FileType markdown   inoremap <buffer> <expr> > search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('> ', '>'): '>'
autocmd FileType *          inoremap <buffer> <expr> ; smartchr#loop(';', ';<Left><Left>')
" autocmd FileType markdown   inoremap <buffer> <expr> ` smartchr#loop('`', '``', '```' , '```<CR>```<Up>')
" autocmd FileType *          inoremap <buffer> <expr> { smartchr#loop('{', '{}', ' {<Cr>}<Left><Cr><Up><Tab>')
" autocmd FileType javascript inoremap <buffer> <expr> { smartchr#loop('{', ' {<Cr>},<Left><Left><Cr><Up><Tab>')
autocmd FileType *          inoremap <buffer> <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('#include', '#define', '#ifdef', '#endif', '@'): '@'

" autocmd FileType *          inoremap <buffer> <expr> " smartchr#loop('"', '""', '""<Left>')
" autocmd FileType *          inoremap <buffer> <expr> ' smartchr#loop("'", "''", "''<Left>")
" autocmd FileType toml       inoremap <buffer> <expr> ' smartchr#loop("'", "''", "'''", "'''<CR>'''<Left><Left><Left><CR><Up><Tab>")

autocmd FileType cs  inoremap <buffer> <expr> / smartchr#loop('/', '//', '/// <summary><CR>/// <`0`><CR>/// </summary>')
autocmd FileType cpp  inoremap <buffer> <expr> / smartchr#loop('/', '//', '/**<CR>*  @brief <`0`><CR>*  @param <`1`> <`2`><CR>*  @return <`3`><CR>*/')
