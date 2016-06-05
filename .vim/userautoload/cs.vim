if expand("%:t") =~ ".*\.cs"
    autocmd FileType cs set omnifunc=OmniSharp#Complete
endif
