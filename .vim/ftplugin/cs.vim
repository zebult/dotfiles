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

function! IsXamarin()
  return stridx(expand("%:p"), "Xamarin") != -1
endfunction

function! SettingXamarin() abort
  nnoremap gl yiwoConsole.WriteLine("p:" + p);
  vnoremap gl yoConsole.WriteLine("p:" + p);
  nnoremap gN yiwOif(p == null){Console.WriteLine("p is null");}
  vnoremap gN yOif(p == null){Console.WriteLine("p is null");}
endfunction
command! -bar SettingXamarin call SettingXamarin()

if IsXamarin()
  call SettingXamarin()
endif

" Xamarin
" let file_name = expand("%")
" let split_list = split(file_name,'\.')
" if len(split_list) >= 3
"   let ext = split_list[-2].'.'.split_list[-1]
"   if ext == 'xaml.cs'
"     SettingXamarin
"   endif
" endif

function! SettingRawCs() abort
  nnoremap gl yiwoConsole.WriteLine("p:" + p);
  vnoremap gl yoConsole.WriteLine("p:" + p);
  nnoremap gL yiwoConsole.WriteLine("call p");
  vnoremap gL yoConsole.WriteLine("call p");
  inoremap log Console.WriteLine("");hh

  call UsingDelete()

  call LoadNugetLibrary()
endfunction
command! -bar SettingRawCs call SettingRawCs()

function! UsingDelete() abort
  augroup fix_using
    autocmd!
  augroup END
endfunction
command! -bar UsingDelete call UsingDelete()

" nnoremap <Leader>r :QuickRun cs/mcs<CR>
" nnoremap <Leader>r :QuickRunCS<CR>
" function! QuickRunCS() abort
"   silent execute "!mcs %"
"   let exeFile = "%:r".".exe"
"   silent execute "!mono ".exeFile
"   silent execute "!rm ".exeFile
" endfunction
" command! -bar QuickRunCS call QuickRunCS()

augroup cs_group
    autocmd!
    " autocmd FileType cs set omnifunc=OmniSharp#Complete
    " autocmd FileType cs call BufferList()
    " autocmd FileType cs TagbarOpen
augroup END
