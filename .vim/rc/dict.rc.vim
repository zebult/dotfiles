let $DOTDICT = expand('~/.vim/dict')
autocmd FileType cpp :set dictionary+=$DOTDICT/cpp-cocos2dx.dict
autocmd FileType cpp :set dictionary+=$DOTDICT/cpp-libstdc++.dict
autocmd FileType objc :set dictionary+=$DOTDICT/objc.dict
autocmd FileType java :set dictionary+=$DOTDICT/java.dict
autocmd FileType cs :set dictionary+=$DOTDICT/cs.dict
autocmd FileType html :set dictionary+=$DOTDICT/html.dict
autocmd FileType css :set dictionary+=$DOTDICT/css.dict
