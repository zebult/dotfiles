let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
" nnoremap <Leader>s :GitGutterLineHighlightsToggle<CR>
nmap dj <Plug>GitGutterNextHunk
nmap dk <Plug>GitGutterPrevHunk

omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

nnoremap g>> :GitGutterStageHunk<CR>

ca df GitGutterPreviewHunk
ca ad GitGutterStageHunk
