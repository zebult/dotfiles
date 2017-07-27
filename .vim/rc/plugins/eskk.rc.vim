" http://openlab.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1

" https://github.com/koturn/vim-config-files/blob/57d4129b5753e48589728a4fdd20e651895108d2/.vim/plugin-config/eskk.vim

imap <F10> <Plug>(eskk:toggle)

let g:eskk#no_default_mappings = 1

let g:eskk#start_completion_length = 2
let g:eskk#show_candidates_count = 2

let g:eskk#marker_henkan = '»'
let g:eskk#marker_okuri = '*'
let g:eskk#marker_henkan_select = '«'
let g:eskk#marker_jisyo_touroku = '?'

let g:eskk#dictionary = {'path' : '~/.skk-jisyo', 'sorted' : 0, 'encoding' : 'utf-8'}
let g:eskk#large_dictionary = {'path' : '~/.eskk/SKK-JISYO.L', 'sorted' : 1, 'encoding' : 'euc-jp'}

let g:eskk#debug = 0
let g:eskk#rom_input_style = 'msime'
let g:eskk#revert_henkan_style = 'okuri'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#enable_completion = 1
let g:eskk#keep_state = 0
