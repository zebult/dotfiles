" gina
ca gadd Gina add .
ca gad Gadc
ca gcm Gina commit -v
nnoremap cc :Gina commit -v<CR>
ca gst Gst
nnoremap <Leader>S :Gst<CR>
nnoremap <Leader>s :Gstc<CR>
ca gfc Gina fetch
ca gsh Gina stash
ca gpop Gina stash pop
ca gdf Gdf
ca gdfa Gina diff
ca glo Gina log --opener=vsplit
ca gloo Gloo
ca gcp Gina cherry-pick
ca grh Gina reset --hard
ca grb Gina rebase
ca grbc Gina rebase --continue
ca grba Gina rebase --abort
ca gacm Gacm
ca gg Gacm
ca gamd Gamd
ca gps Gps
ca gpl Gpl

" let g:gina#command#status#use_default_mappings = 0

" fugitive
" http://wakame.hatenablog.jp/entry/2017/05/03/222511
" add      : -
" patch    : p
" diff     : D
" checkout : U
let g:netrw_browsex_viewer = 'open'
ca gbl Gblame
ca glof Glog

"denite-git
ca gco Denite -highlight-mode-insert=Search gitbranch<CR>
ca gstl Denite -highlight-mode-insert=Search gitstatus<CR>
ca gdfl Denite -highlight-mode-insert=Search gitstatus<CR>
ca glob Glog<CR>

ca globb Gitv!<CR>

"shell
ca gbr Gbr
ca gbd Gbd

" gitv
nnoremap gh :GTree<CR>

function! GTree() abort
  Gitv --all
  QuickhlManualAdd r:origin/develop
  QuickhlManualAdd HEAD
  QuickhlManualAdd (develop)
  QuickhlManualAdd (HEAD -> develop, r:origin/develop)
  /develop
endfunction
command! -nargs=0 GTree call GTree()

function! Gacm() abort
  Gina add .
  Gina commit -v
endfunction
command! -nargs=0 Gacm call Gacm()

function! Gamd() abort
  Gina add .
  Gina commit --amend
endfunction
command! -nargs=0 Gamd call Gamd()

function! Gst() abort
  Gina status -s --opener=vsplit
endfunction
command! -nargs=0 Gst call Gst()

function! Gstc() abort
  vs
  Gina diff --cached --opener=vsplit
  Gst
endfunction
command! -nargs=0 Gstc call Gstc()

function! Gadc() abort
  Gina add .
  Gstc
endfunction
command! -nargs=0 Gadc call Gadc()

function! Gdf() abort
  Gina compare --opener=vsplit --oneside
  " norm! <C-w>L
  silent! <C-w>L
endfunction
command! -nargs=0 Gdf call Gdf()

function! Gps(...) abort
  let branch = system("git rev-parse --abbrev-ref HEAD")
  let command = 'Gina push origin '.branch[0:-2]

  if a:0 >= 1
    let command = command." ".a:1
  end

  echo command
  execute command
endfunction
command! -nargs=? Gps call Gps(<f-args>)

function! Gpl() abort
  let branch = system("git rev-parse --abbrev-ref HEAD")
  let command = 'Gina pull origin '.branch[0:-2]
  echo command
  execute command
endfunction
command! -nargs=0 Gpl call Gpl()

function! Gloo() abort
  let branch = system("git rev-parse --abbrev-ref HEAD")
  let command = 'Gina log remotes/origin/'.branch[0:-2]
  execute command
endfunction
command! -nargs=0 Gloo call Gloo()

function! Gbr() abort
  let branch = system("git rev-parse --abbrev-ref HEAD")
  echo branch[0:-2]
endfunction
command! -nargs=0 Gbr call Gbr()

function! Gbd() abort
  let hoge = system("git branch --merged|egrep -v '\\*|develop|master|design|design/design-mock'|xargs git branch -d")
endfunction
command! -nargs=0 Gbd call Gbd()
