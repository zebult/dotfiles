" Set refresh time in ms
let g:SrcExpl_RefreshTime = 1000
" Is update tags when SrcExpl is opened
let g:SrcExpl_isUpdateTags = 0
" Tag update command
let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
" Update all tags
function! g:SrcExpl_UpdateAllTags()
let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
call g:SrcExpl_UpdateTags()
let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
endfunction
" Source Explorer Window Height
let g:SrcExpl_winHeight = 14
" Mappings
nnoremap <Leader>h :<C-u>SrcExplToggle<Cr>
" nm <Leader>E [srce]
" nmap <Space>h :SrcExplToggle<CR>
" nmap [srcexpl]s :SrcExplToggle<CR>
" nmap [srcexpl]u :call g:SrcExpl_UpdateTags()<CR>
" nmap [srcexpl]a :call g:SrcExpl_UpdateAllTags()<CR>
" nmap [srcexpl]n :call g:SrcExpl_NextDef()<CR>
" nmap [srcexpl]p :call g:SrcExpl_PrevDef()<CR>
