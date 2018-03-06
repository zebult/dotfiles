" Mappings

function! MinimumMapping() abort
  nnoremap <Leader>w :w<Cr>
  nnoremap <Leader>q :q<Cr>
  nnoremap <Leader>Q :qa<Cr>
  nnoremap <Leader>e :bd<Cr>
  nnoremap <Leader>2 :wq<Cr>
  nnoremap <Leader>! :q!<Cr>
  nnoremap <Leader># :qa!<Cr>
  noremap ;  :
  noremap :  ;
  inoremap jj <ESC><ESC><ESC>
  nnoremap <Tab> %
  vnoremap <Tab> %
nnoremap <F11> <C-i>

endfunction
command -bar MinimumMapping call MinimumMapping()

function! InitMapping() abort
  let b:lexima_disabled = 1
  mapclear
endfunction
command -bar InitMapping call InitMapping()

MinimumMapping

nnoremap <silent> <ESC><ESC> :cclose<CR>:nohlsearch<CR>:NoHighlightTrailingSpaces<CR>:TagbarClose<CR>:set nocursorline<CR>:HierClear<CR>:set nocursorcolumn<CR>:args<CR>:redraw!<CR>
nnoremap <silent> 111 :e!<CR>
" nnoremap <silent> <ESC><ESC> :cclose<CR>:nohlsearch<CR>:NoHighlightTrailingSpaces<CR>:set nocursorline<CR>:set nocursorcolumn<CR>:args<CR>:redraw!<CR>
" 単語をヤンクレジスタで置換 ???
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" and検索
nnoremap <Leader>& /\(A.*B\)
" or検索
nnoremap <Leader>\| /\(A\\|B\)
" ペースト直後に選択
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" 行数切り替え
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

nnoremap <Down> 5j
nnoremap <Up> 5k

noremap 8* *N

noremap <C-e> 2<C-e>
noremap <C-y> 2<C-y>
" タグジャンプやりやすく
nnoremap tj gD
" diffすぐ出す
ca difff vertical diffsplit
ca ccd lcd %:h

ca al Align
" 指定範囲インデント調節の連続化
vnoremap > >gv
vnoremap < <gv
" 前回編集した箇所選択
nnoremap gc  `[v`]
" 全選択
nnoremap g0 ggVG
" 全インデント揃える
nnoremap gI miggVG='izz
" 貼り付けたらテキストの末尾へ
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap & :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" filename to  clipboard
nnoremap <Leader>N mfi<C-r>%<ESC>v'fyu

" Screen split key mappings
" nnoremap sN :<C-u>bn<CR>
" nnoremap sP :<C-u>bp<CR>
" nnoremap fn :<C-u>bn<CR>
" nnoremap fp :<C-u>bp<CR>
" nnoremap <Leader>s :<C-u>bn<CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap dn :<C-u>bn<CR>
nnoremap dp :<C-u>bp<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
" tagsジャンプを新規タブで開く
nnoremap sgf <C-w>gf
" tagsジャンプを画面分割で開く
nnoremap s<C-]> :<C-u>sp<CR><C-w>j<C-]>
vnoremap <C-]> :<C-u>vs<CR><C-w>l<C-]>
nnoremap t<C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap t<C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>1<CR>
" nnoremap S<C-]> :<C-u>sp<CR><C-w>j<C-]>
nnoremap sw <C-w>w
" nnoremap so <C-w>o
" nnoremap sO <C-w>=
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>new<CR><C-w>J
nnoremap sv :<C-u>vert new<CR><C-w>L
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
vnoremap s% y:%s ///g<Left><Left><Left><C-r>0<Right><C-r>0
nnoremap s% :%s ///g<Left><Left><Left><C-r><C-w><Right><C-r><C-w>
nnoremap S% :%s ///g<Left><Left><Left>\<<C-r><C-w>\><Right><C-r><C-w>

nnoremap cn :QuickFixNext<CR>
nnoremap cp :QuickFixPrev<CR>

vnoremap c% y:cdo s///g <Bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><C-r>0<Right><C-r>0
nnoremap c% :cdo s///g <Bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><C-r><C-w><Right><C-r><C-w>
nnoremap C% :cdo s///g <Bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>\<<C-r><C-w>\><Right><C-r><C-w>

for n in range(1, 9)
  execute 'nnoremap <silent> '.n.'t :<C-u>tabnext'.n.'<CR>'
endfor
" nnoremap <silent> 2t :<C-u>tabnext2<CR>
" Memo日付移動
" nnoremap g, i
" nnoremap g. i

""""""""""""""""""""""""""""""
"  ex mode
""""""""""""""""""""""""""""""
" ディレクトリを手早く展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" 強制保存
cnoreabbrev wq!! w !sudo tee > /dev/null %<CR>:q!<CR>
cnoreabbrev w!! w !sudo tee > /dev/null %
" emacs
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
" logical search
cnoremap <Bar><Bar> <Bslash><Bar>
cnoremap && .*
" cnoremap ( \(
""""""""""""""""""""""""""""""

" Power tools
nnoremap <Leader>u :Unite source<CR>
" nnoremap <Leader>R :!cocos run -s . -p ios<Cr>" TODO: . want git path
nnoremap <Leader>v :VimShell<CR>

" includeへ移動
" nnoremap <buffer><silent> <Space>k :execute "?".&include<CR> :noh<CR> o
" nnoremap gt :Calendar -view=clock<CR>
autocmd FileType html nnoremap <Leader>r :!open %<CR>
autocmd FileType tex nnoremap <Leader>r :QuickRun<CR>:!latexmk -c<CR>
nnoremap <Leader>O :!open .<CR><CR>
" nnoremap <Leader>A :VimFiler -split -simple -winwidth=25 -no-quit<CR>:SrcExplToggle<CR>:TagbarToggle<CR><C-w>l
nnoremap <Leader>A :VimFilerBufferDir -split -simple -winwidth=40 -no-quit<CR><C-w>l:TagbarClose<CR>:TagbarOpen<CR>
nnoremap <Leader>$ :%s/\s\+$//ge<CR>

nnoremap t$ v$:TogglSelectStart<CR>

set completeopt=menuone
inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-x>\<C-o>\<C-p>" : "\<Tab>"
let MyAutoComplete_StartLength = 3

let memo_path     = "~/Dropbox/Saichi/Diary/".strftime("%Y/%m/%d", localtime()).".md"
execute 'nnoremap me :<C-u>tabe'.memo_path.'<CR>'
nmap Q <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S ==========")<CR><CR>

" <C-m>はEnterと同じ扱い
" nnoremap <C-m> gd:nohlsearch<CR>
nmap gp Riw
" nmap cp Riw

" nnoremap gh ,
" nnoremap gl ;
nnoremap ˙ ,
nnoremap ¬ ;
" nnoremap gf f
" nnoremap gF F
" nnoremap gt t
" nnoremap gT T

nnoremap [[ [m
nnoremap g[[ [M
nnoremap ]] ]m
nnoremap g]] ]M

vnoremap [[ [m
vnoremap g[[ [M
vnoremap ]] ]m
vnoremap g]] ]M
" nnoremap gd gd

nnoremap <Leader>H :CHL<CR>:CML<CR>

" nnoremap <expr> 1 match(strpart(getline('.'), 0, col('.') - 1), '^\s\+$') >= 0 ? '0' : '^'

nnoremap <expr> 0
\         col('.') == 1 ? '^' : '0'

" nnoremap <expr> 0
" \  match(strpart(getline('.'), 0, col('.') - 1), '^\s\+$') >= 0 ? '0' : '^'

nnoremap <silent> <C-n> :cn<CR>:CML<CR>*Nzz
nnoremap <silent> <C-p> :cp<CR>:CML<CR>*Nzz

" マーク周りの改善
noremap ' `

noremap <Bar> =

" 選択してもそのまま貼り付けられるようにする
vnoremap <silent> p "0p
