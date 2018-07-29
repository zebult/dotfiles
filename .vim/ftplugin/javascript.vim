nnoremap gl yiwoconsole.log("p:" + p);
vnoremap gl yoconsole.log("p:" + p);
nnoremap gL yiwoconsole.log("call p");
vnoremap gL yoconsole.log("call p");

function! SettingGas() abort
  nnoremap gl yiwoBrowser.msgBox("p:", p, Browser.Buttons.OK);
  vnoremap gl yoBrowser.msgBox("p:", p, Browser.Buttons.OK);
  nnoremap gL yiwoBrowser.msgBox("call p", Browser.Buttons.OK);
  vnoremap gL yoBrowser.msgBox("call p", Browser.Buttons.OK);
  inoremap log Browser.msgBox("", Browser.Buttons.OK);F"
endfunction
command! -bar SettingGas call SettingGas()
