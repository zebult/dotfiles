    let g:gitgutter_map_keys = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <Leader>s :GitGutterLineHighlightsToggle<CR>
    nmap s] <Plug>GitGutterNextHunk
    nmap s[ <Plug>GitGutterPrevHunk
    ca status GitGutterPreviewHunk

