let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
nnoremap <Leader>s :GitGutterLineHighlightsToggle<CR>
nnoremap Rj gj
nnoremap Rk gk
nmap dj <Plug>GitGutterNextHunk
nmap dk <Plug>GitGutterPrevHunk
" nmap df <Plug>GitGutterPreviewHunk
ca df GitGutterPreviewHunk
