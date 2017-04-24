let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
nnoremap <Leader>s :GitGutterLineHighlightsToggle<CR>
nmap dj <Plug>GitGutterNextHunk
nmap dk <Plug>GitGutterPrevHunk
nmap df <Plug>GitGutterPreviewHunk
ca df GitGutterPreviewHunk
