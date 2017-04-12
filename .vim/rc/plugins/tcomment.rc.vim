let g:tcommentMapLeader1 = '<F12>'
" let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = 'gc'
let g:tcommentMapLeaderOp2 = 'gC'

call tcomment#DefineType('objc', '// %s')

nmap <Bslash><Bslash> ==
