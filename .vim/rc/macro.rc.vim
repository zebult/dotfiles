function! AutoMethodMakeMacro() abort
  " normal 0wms"my$gg/class\w"cyiwGo"mpxa {\}\kk0w"cPa::'sj
  normal 0wms"my$gg/classw"cyiwGo"mpxa {k0w"cPa::'sj
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

function! CppAutoFunc(class) range
  for linenum in range(a:firstline, a:lastline)
    norm mzyy}P^e
    redi @z
    silent echo a:class
    redi END
    norm "zpkJea::lx
    norm $xa{dd'zj
  endfor
endfunction
command! -range -nargs=? CppAutoFunc <line1>,<line2>call CppAutoFunc(<f-args>)

function! CafConvert() range
  for linenum in range(a:firstline, a:lastline)
    norm 0y$iafconvert -f caff -d 0 lv$hS"$a pvT S"$T.ciwcafj
  endfor
endfunction
command! -range -nargs=? CafConvert <line1>,<line2>call CafConvert(<f-args>)

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

" Auto entity create
function! AutoUnityEntityCreate() abort
  normal mu
  normal "eyiw/convertj%k%kkVjypkdiw"ePj0fT2lde"eP
  normal "cyiwG?privatevipyjpokkdiinkkkwd$"epNwdiw"ePwdiw"cP
  normal bb;OmniSharpGotoDefinitionjjviiyjopo{j
  normal }kddkvip;FieldToEntity
endfunction
command! -bar AutoUnityEntityCreate call AutoUnityEntityCreate()

" フィールドをエンティティ代入式に変換
function! FieldToEntity() range
  for linenum in range(a:firstline, a:lastline)
    execute linenum." call s:PrivateFieldToEntity()"
  endfor

  normal vip;Align =
  normal vip==
  normal {iDebug.Log("");hhh"epa Specialize==
  normal o"epa Entity = new "epa();==
  normal V}k;Align =
  normal }ireturn Entity;==
  normal 'u

endfunction
command! -range FieldToEntity <line1>,<line2>call FieldToEntity()

function! s:PrivateFieldToEntity() abort
    let repl = substitute(getline('.'),'public','','g')
    call setline(line("."), repl)

    normal w"zyiw"0ciwEntity.l"0x$i = ("zp$irow["^f.lyiwf"pviwC

    let repl = substitute(getline('.'),'(float)','System.Convert.ToSingle(','g')
    call setline(line("."), repl)

    let repl = substitute(getline('.'),'(bool)','System.Convert.ToBoolean(','g')
    call setline(line("."), repl)

    if match(getline('.'), 'ToSingle') != -1
      normal $i)
    endif

    if match(getline('.'), 'ToBoolean') != -1
      normal $i)
    endif
endfunction

" エンティティのkeyにメンバ代入
function! EntityIntoKey()
    normal 0f.lyiwf"lgpviwCj0
endfunction
command! -range EntityIntoKey <line1>,<line2>call EntityIntoKey()

" エンティティのコンバーターを適当に作成
function! EntityToConverter()
    normal $b"zyiwOEntity."zpa = j^wyiwk$a(pla row[""zp$a;
    call EntityIntoKey()
    normal dd
endfunction
command! -range EntityToConverter <line1>,<line2>call EntityToConverter()

" c++ document to c#
function! DocmentCppToCs() abort
  InitMapping
  normal {//%r/$a <summary>////\n$a </summary>
  MinimumMapping
endfunction
command! -bar DocmentCppToCs call DocmentCppToCs()

" c++ document to c#
function! DocmentParamCppToCs()
  InitMapping
  normal 0f@r<wwiname="t a">$a</param>
  MinimumMapping
endfunction
command! -range DocmentParamCppToCs <line1>,<line2>call DocmentParamCppToCs()
