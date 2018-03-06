let g:bookmark_sign = '.'
let g:bookmark_annotation_sign = '*'
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_center = 1

" nnoremap mm :BookmarkAnnotate 
nnoremap mm :BookmarkToggle<CR>
nnoremap ml :BookmarkShowAll<CR>
nnoremap mc :BookmarkClear<CR>
" nnoremap zm :BookmarkToggle<CR>
" nnoremap zM :BookmarkAnnotate<CR>
" nnoremap zl :BookmarkShowAll<CR>
" nnoremap zn :BookmarkNext<CR>
" nnoremap zp :BookmarkPrev<CR>
