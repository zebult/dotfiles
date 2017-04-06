let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
nnoremap <Leader>s :GitGutterLineHighlightsToggle<CR>
nmap dn <Plug>GitGutterNextHunk
nmap dp <Plug>GitGutterPrevHunk
nmap df <Plug>GitGutterPreviewHunk
ca df GitGutterPreviewHunk
