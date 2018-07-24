" setlocal tabstop=4
setlocal shiftwidth=4

" 空白文字ではなくてタブ文字を使用する
" setlocal noexpandtab

" Log
nnoremap gl yiwoDebug.Log("p:" + p);
vnoremap gl yoDebug.Log("p:" + p);
nnoremap gL yiwoDebug.Log("call p");
vnoremap gL yoDebug.Log("call p");

" null
nnoremap gN yiwOif(p == null){Debug.Log("p is null");}
vnoremap gN yOif(p == null){Debug.Log("p is null");}

" Assert
nnoremap ga yiwoDebug.Assert(p != null, "" + p);
vnoremap ga yoDebug.Assert(p != null, "" + p);

" Xamarin
let file_name = expand("%")
let split_list = split(file_name,'\.')
if len(split_list) >= 3
  let ext = split_list[-2].'.'.split_list[-1]
  if ext == 'xaml.cs'
    SettingXamarin
  endif
endif

function! SettingRawCs() abort
  nnoremap gl yiwoConsole.WriteLine("p:" + p);
  vnoremap gl yoConsole.WriteLine("p:" + p);
  nnoremap gL yiwoConsole.WriteLine("call p");
  vnoremap gL yoConsole.WriteLine("call p");
  inoremap log Console.WriteLine("");hh
endfunction
command! -bar SettingRawCs call SettingRawCs()

function! SettingXamarin() abort
  nnoremap gl yiwoDebug.WriteLine("p:" + p);
  vnoremap gl yoDebug.WriteLine("p:" + p);
  nnoremap gN yiwOif(p == null){Debug.WriteLine("p is null");}
  vnoremap gN yOif(p == null){Debug.WriteLine("p is null");}
endfunction
command! -bar SettingXamarin call SettingXamarin()

" nnoremap <Leader>r :QuickRun cs/mcs<CR>
" nnoremap <Leader>r :QuickRunCS<CR>
" function! QuickRunCS() abort
"   silent execute "!mcs %"
"   let exeFile = "%:r".".exe"
"   silent execute "!mono ".exeFile
"   silent execute "!rm ".exeFile
" endfunction
" command! -bar QuickRunCS call QuickRunCS()

augroup cs_groupe
    autocmd!
    autocmd FileType cs set omnifunc=OmniSharp#Complete
augroup END
