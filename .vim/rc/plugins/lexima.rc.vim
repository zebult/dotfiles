let g:lexima_enable_space_rules = 0

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" 記号のケツ側文字の背後をtabで取れるようにする
" http://karubabu.hateblo.jp/entry/2017/05/24/190010
call lexima#add_rule({'char': '<TAB>', 'at': '\%#)', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#"', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#''', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#]', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#}', 'leave': 1})

" ignore を設定できるようなヘルパ関数を書いてみた
" http://secret-garden.hatenablog.com/entry/2015/05/21/194914
" (| を入力した時に () の補完を行う
call lexima#add_rule({'char': '(', 'input_after': ')'})
" ただし、以下の場合は補完しない
" |) の場合は補完しない
call lexima#add_rule({'char': '(', 'input': '(', 'at': '\%#)'})
" コメント内では補完しない
call lexima#add_rule({'char': '(', 'input': '(', 'syntax' : 'Comment'})
" 文字列内では補完しない
call lexima#add_rule({'char': '(', 'input': '(', 'syntax' : 'String'})

call lexima#add_rule({'char': '[', 'input_after': ']'})
" |] の場合は補完しない
call lexima#add_rule({'char': '[', 'input': '[', 'at': '\%#]'})
" - |[ ] の場合は補完しない
call lexima#add_rule({'char': '[', 'input': '[', 'at': '- \%#'})
