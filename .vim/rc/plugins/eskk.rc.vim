" http://d.hatena.ne.jp/alwei/20111029/1319905783
" http://openlab.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1
let g:eskk#directory = '~/.eskk'
let g:eskk#dictionary = {
      \     'path' : "~/.skk-jisyo",
      \     'sorted' : 0,
      \     'encoding' : 'utf-8',
      \}
let g:eskk#large_dictionary = {
      \     'path' : "/usr/share/skk/SKK-JISYO.L",
      \     'sorted' : 1,
      \     'encoding' : 'euc-jp',
      \}
let g:eskk#enable_completion = 1

map! <C-b> <Plug>(eskk:toggle)
