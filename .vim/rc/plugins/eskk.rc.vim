" http://openlab.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1
" https://github.com/koturn/vim-config-files/blob/57d4129b5753e48589728a4fdd20e651895108d2/.vim/plugin-config/eskk.vim

let g:eskk#dictionary = {'path' : '~/Dropbox/Saichi/AquaSKK/skk-jisyo.utf8', 'sorted' : 0, 'encoding' : 'utf-8'}
let g:eskk#large_dictionary = {'path' : '~/Dropbox/Saichi/AquaSKK/SKK-JISYO.L', 'sorted' : 1, 'encoding' : 'euc-jp'}

" Enterによる確定で改行しない
let g:eskk#egg_like_newline = 0
let g:eskk#enable_completion = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#map_normal_keys = 0
let g:eskk#select_cand_keys = ";"
let g:eskk#show_annotation = 1
let g:eskk#rom_input_style = 'msime'
let g:eskk#keep_state = 0
let g:eskk#log_cmdline_level = 2
let g:eskk#log_file_level = 4
