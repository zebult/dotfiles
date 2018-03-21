" gina
ca gad Gina add .
ca gcm Gina commit -v
ca gst Gina status -s --opener=vsplit
ca gfc Gina fetch
ca glo Gina log --opener=vsplit
ca gloo Gloo
ca grh Gina reset --hard
ca gacm Gacm
ca gps Gps
ca gpl Gpl

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
ca gco Denite -highlight-mode-insert=Search gitbranch
ca gdf Denite -highlight-mode-insert=Search gitstatus

"shell
ca gbr Gbr
ca gbd Gbd

function! Gacm() abort
  Gina add .
  Gina commit -v
endfunction
command! -nargs=0 Gacm call Gacm()

function! Gps() abort
  let branch = system("git rev-parse --abbrev-ref HEAD")
  let command = 'Gina push origin '.branch[0:-2]
  echo command
  execute command
endfunction
command! -nargs=0 Gps call Gps()

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
