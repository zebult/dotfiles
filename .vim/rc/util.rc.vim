" spell
set spelllang=en,cjk
nnoremap # :call SpellToggle()<CR>
function! SpellToggle()
    setlocal spell!
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction

"google complete <C-x><C-u>
set completefunc=GoogleComplete
function! GoogleComplete(findstart, base)
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\S'
            let start -= 1
        endwhile
        return start
    else
        let ret = system('curl -s -G --data-urlencode "q='
                    \ . a:base . '" "http://suggestqueries.google.com/complete/search?&client=firefox&hl=ja&ie=utf8&oe=utf8"')
        let res = split(substitute(ret,'\[\|\]\|"',"","g"),",")
        return res
    endif
endfunction

command! -nargs=? Eiwa call Goo("ej",<f-args>)
command! -nargs=? Ruigo call Goo("thsrs",<f-args>)
command! -nargs=? Kokugo call Goo("jn",<f-args>)
command! -nargs=? Waei call Goo("je",<f-args>)
function! Goo(jisyo,...)
    if has('win32') || has('gui_running')
        let l:cmd = "!"
    else
        let l:cmd = "!clear && "
    endif
    if a:0 == 0
        let l:search_word = expand("<cword>")
    else
        let l:search_word = a:1
    endif
    if a:jisyo == "ej"
        let l:search_tag = " | perl -nle 'print if /alllist/i../<\\/dl>/ or /prog_meaning/'"
    elseif a:jisyo == "je"
        let l:search_tag = " | perl -nle 'print if /alllist/i../<\\/dl>/ or /prog_meaning|prog_example/'"
    elseif a:jisyo == "jn"
        let l:search_tag = " | perl -nle 'print if /alllist/i../<\\/dl>/ or /meaning/'"
    elseif a:jisyo == "thsrs"
        let l:search_tag = " | perl -nle 'print if /--wordDefinition/i../--\\/wordDefinition/i'"
    endif
    execute l:cmd . "curl -s -L " .
                \ "http://dictionary.goo.ne.jp/srch/" . a:jisyo . "/" .
                \ "$(echo " . l:search_word . " | nkf -wMQ | tr = \\%)" .
                \ "/m1u/ " .
                \ l:search_tag .
                \ " | perl -ple 's/<.+?>//g'"
                \ " | head -50"
endfunction

" clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

" vimdiff
function Diff()
    :tabne
    :edit OLD
    :setlocal scrollbind
    :rightbelow vnew NEW
    :setlocal scrollbind
endfunction

" 無限undo
if has('persistent_undo')
	set undodir=~/.vimundo
	set undofile
endif

" autocmd QuickFixCmdPre call CursorLineColorHighlight()

" 最後のカーソル位置を復元する
augroup UtilitiesGroup
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
augroup END
