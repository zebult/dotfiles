map <Leader>j <Plug>(easymotion-w)
" map <Leader>h <Plug>(easymotion-b)
map <Leader>k <Plug>(easymotion-b)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>l <Plug>(easymotion-w)
" map <Leader>h <Plug>(easymotion-b)
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvb'
" 以下機能しない処理
" let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " 先頭列へ行く機能off
let g:EasyMotion_use_upper = 1 " uppercaseに対応
let g:EasyMotion_enter_jump_first = 1 " enterで最初にhitしたとこへjump
let g:EasyMotion_space_jump_first = 1 " spaceで最初にhitしたとこへjump
" Color
hi EasyMotionTarget ctermbg=none ctermfg=82
hi EasyMotionTarget2First ctermbg=none ctermfg=196
hi EasyMotionTarget2Second ctermbg=none ctermfg=196
hi EasyMotionShade ctermfg=8
