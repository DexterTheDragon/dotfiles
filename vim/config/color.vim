"   All coloring options are for the non-GUI Vim (see :help cterm-colors).
syntax on                       "syn:   syntax highlighting

" set t_Co=16
" color xoria256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


" I love the new CursorLine, but terminal underlining kicks legibility in the nuts.
" So what to do? Bold is (extremely) subtle, but it's better than nothing.
hi CursorLine cterm=bold

hi SignColumn ctermbg=235
" The default fold color is too bright and looks too much like the statusline
hi Folded cterm=bold ctermbg=237

" highlight OverLength ctermbg=red
" match OverLength /\%81v.\+/

" Statusline
" I like this better than all the reverse video of the default statusline.
" hi Test1 ctermfg=61 ctermbg=235
" hi Test2 ctermfg=124 ctermbg=235
" hi Test3 ctermfg=33 ctermbg=235
" hi Test5 ctermfg=37 ctermbg=235
" hi Test6 ctermfg=64 ctermbg=235
" hi Test8 ctermfg=166 ctermbg=235
" hi Test9 ctermfg=244 ctermbg=235
" hi StatusLine ctermfg=61 ctermbg=235
" hi StatusLineNC term=reverse cterm=bold ctermfg=8
" Hack to make StatusLineNC a single color
" hi link User1 Test1
" hi link User2 Test2
" hi link User3 Test3
" hi link User4 StatusLine
" hi link User5 Test5
" hi link User6 Test6
" hi link User8 Test8
" hi link User9 Test9
