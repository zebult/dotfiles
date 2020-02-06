nnoremap gl yiwoconsole.log("p:" + p);
vnoremap gl yoconsole.log("p:" + p);
nnoremap gL yiwoconsole.log("call p");
vnoremap gL yoconsole.log("call p");

function! SettingGas() abort
  nnoremap gl yiwoBrowser.msgBox("p:" + p);
  vnoremap gl yoBrowser.msgBox("p:" + p);
  nnoremap gL yiwoBrowser.msgBox("call p");
  vnoremap gL yoBrowser.msgBox("call p");
  inoremap log Browser.msgBox("");F"
endfunction
command! -bar SettingGas call SettingGas()
