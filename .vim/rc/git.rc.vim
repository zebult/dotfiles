" gina
ca gad Gina add .
ca gadc Gina add %:p
ca gadp Gina!! add -p
ca gcm Gina commit -v
nnoremap cc :Gina commit -v<CR>
ca gst Gst
nnoremap <Leader>s :Gst<CR>
nnoremap <Leader>S :Gstv<CR>
ca gfc Gina fetch
ca gsh Gina stash
ca gpop Gina stash pop
ca gdft GdfTool
ca gdf Gina diff
ca glo Gina log --opener=vsplit
" ca glo Gina log
" ca gloo Gloo
ca gcp Gina cherry-pick
ca grs Gina reset
ca grsp Gina!! reset -p
ca grh Gina reset --hard
ca gcl Gina clean -df
ca grb Gina rebase
ca grbc Gina rebase --continue
ca grba Gina rebase --abort
ca gacm Gacm
ca gg Gacm
ca gamd Gamd
ca gps Gps
nnoremap <Leader>p :Gps<CR>
ca gpl Gpl
" nnoremap <Leader>b :Gina branch<CR>
nnoremap <silent> <Leader>b :Denite -highlight-mode-insert=Search gitbranch<CR>
ca gbr Gina branch 
ca gcob Gina checkout -b
" ca gco Gco

" let g:gina#command#status#use_default_mappings = 0

" fugitive
" http://wakame.hatenablog.jp/entry/2017/05/03/222511
" add      : -
" patch    : p
" diff     : D
" checkout : U
let g:netrw_browsex_viewer = 'open'
ca gbl Gblame
" ca glof Glog

"denite-git
" nnoremap go :Denite -highlight-mode-insert=Search -auto-preview gitstatus<CR>
nnoremap <silent> go :Denite -highlight-mode-insert=Search gitstatus<CR>
ca <silent> gco Denite -highlight-mode-insert=Search gitbranch<CR>
ca <silent> gbrd Denite -highlight-mode-insert=Search -default-action=delete gitbranch<CR>
ca <silent> gmg Denite -highlight-mode-insert=Search -default-action=merge gitbranch<CR>
ca <silent> glob Glog<CR>

" ca globb Gitv!<CR>

"shell
ca gbd Gbd

" gitv
" nnoremap gh :GTree<CR>

function! GTree() abort
  Gitv --all
  QuickhlManualAdd r:origin/develop
  QuickhlManualAdd HEAD
  QuickhlManualAdd (develop)
  QuickhlManualAdd (HEAD -> develop, r:origin/develop)
  /develop
endfunction
command! -nargs=0 GTree call GTree()

function! Gacm(...) abort
  Gina add .

  if a:0 >= 1
    execute "Gcommit -m ".a:1
  else
    Gina commit -v
  end

endfunction
command! -nargs=? Gacm call Gacm(<f-args>)

function! Gamd() abort
  Gina add .
  Gina commit --amend
endfunction
command! -nargs=0 Gamd call Gamd()

function! Gst() abort
  Gina diff --cached --opener=split
  Gina status -s --opener=vsplit
  " Gina diff --opener=vsplit
endfunction
command! -nargs=0 Gst call Gst()

function! Gstv() abort
  Gina diff --opener=vsplit
  Gina diff --cached --opener=vsplit
  Gst
endfunction
command! -nargs=0 Gstv call Gstv()

function! GdfTool() abort
  Rooter
  " let diff_list = systemlist("git diff --name-only")
  let diff_list = systemlist("git status -sb | tail +2 | awk '{print $2}'")
  for file_name in diff_list
    execute "e ".file_name
  endfor
  tab ba
  tabdo Gdiff
endfunction
command! -nargs=0 GdfTool call GdfTool()

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

function! Gco() abort
  10split
  Gina branch
endfunction
command! -nargs=0 Gco call Gco()
