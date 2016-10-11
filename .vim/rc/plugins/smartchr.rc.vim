" TODO: 言語によってはにしたい
inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' == ')
inoremap <buffer> <expr> , smartchr#loop(', ', ',')
inoremap <buffer> <expr> : smartchr#loop(': ', '::')
inoremap <buffer> <expr> ! smartchr#loop('!', '!=')
inoremap <buffer> <expr> - smartchr#loop('- ', '-')
inoremap <buffer> <expr> { smartchr#loop('{', ' {<CR>}')

