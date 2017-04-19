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
