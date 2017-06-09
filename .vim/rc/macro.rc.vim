function! AutoMethodMakeMacro() abort
  normal 0wms"my$gg/classw"cyiwGo"mpxa {}kk0w"cPa::'sj
endfunction
command -bar AutoMethodMakeMacro call AutoMethodMakeMacro()

function! AutoCCLOG() abort
  normal yiwoCCLOG("pa: %"<`0`>,pa<`1`>);^i
  startinsert
endfunction
command -bar AutoCCLOG call AutoCCLOG()

" _xxxYYY to mXxxYYY
function! ChangeUnderToM() abort
  normal mz/_yiwo%s/pa/pa/gbbrml~^y$;0gg/%dd'z
endfunction
command! -bar ChangeUnderToM call ChangeUnderToM()

" setter, getter自動生成
function! AutoCapusule() abort
  " メンバ変数アクセサ生成(m_付き限定)
  0w"tyiww"myiwf_lve"vyopublic <Esc>"tpa <Esc>"vpb~higet<Esc>$a() {return <Esc>"mpa;}<Esc>opublic void <Esc>"vpb~hiset<Esc>$a(<Esc>"tpa <Esc>"vpa) {<Esc>"mpa=<Esc>"vpa;}<Esc>kk0w
" map Kk mawv/ <CR>"ty/ <CR>wve"ny/getters<CR>$a<CR><CR><Esc>xxa<Tab>public <Esc>"tpa<Esc>"npbiget<Esc>l~hea() {<CR><Tab>return <Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxa<Tab>public void <Esc>"npbiset<Esc>l~hea (<Esc>"tpa<Esc>"npa) {<CR><Tab>this.<Esc>"npa = <Esc>"npa;<CR>}<Esc>=<CR>`ak
endfunction
command! -bar AutoCapusule call AutoCapusule()

" Redmine
function! RedmineDateIncrement() abort
  normal /due_date:$hGo w
endfunction
command! -bar RedmineDateIncrement call RedmineDateIncrement()
nnoremap Ra :RedmineDateIncrement<CR>

function! RedmineDateDecrement() abort
  normal /due_date:$hGo w
endfunction
command! -bar RedmineDateDecrement call RedmineDateDecrement()
nnoremap Rx :RedmineDateDecrement<CR>
