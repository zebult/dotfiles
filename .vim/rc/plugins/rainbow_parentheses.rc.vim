let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['lightblue', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['lightgray',       'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]
"
let g:rbpt_max = 16
"
augroup RainbowParenthesesGroup
  autocmd!
  au FileType * RainbowParenthesesLoadRound
  au FileType * RainbowParenthesesLoadSquare
  au FileType * RainbowParenthesesLoadBraces
  au FileType * RainbowParenthesesLoadChevrons
augroup END
