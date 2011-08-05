syntax on                       "syn:   syntax highlighting
"   All coloring options are for the non-GUI Vim (see :help cterm-colors).

" set t_Co=16
" color xoria256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


" The default fold color is too bright and looks too much like the statusline
hi Folded cterm=bold ctermbg=237
" hi FoldColumn cterm=bold ctermfg=9 ctermbg=0

" Darkens the status line for non-active windows. Needs testing!
" au BufEnter * hi User9 ctermfg=7

" A nice, minimalistic tabline
" hi TabLine cterm=bold,underline ctermfg=8 ctermbg=0
" hi TabLineSel cterm=bold ctermfg=0 ctermbg=7
" hi TabLineSel term=none cterm=none ctermfg=15 ctermbg=242
" hi TabLineFill cterm=bold ctermbg=0

" Color lines that exceed 80 columns in blue (doesn't scale)
" hi rightMargin ctermfg=lightblue
" match rightMargin /.\%>80v/





" lets try this again
" I love the new CursorLine, but terminal underlining kicks legibility in the nuts.
" So what to do? Bold is (extremely) subtle, but it's better than nothing.
" hi CursorLine cterm=bold

" Statusline
" I like this better than all the reverse video of the default statusline.
hi Test1 ctermfg=61 ctermbg=235
hi Test2 ctermfg=124 ctermbg=235
hi Test3 ctermfg=33 ctermbg=235
hi Test5 ctermfg=37 ctermbg=235
hi Test6 ctermfg=64 ctermbg=235
hi Test8 ctermfg=166 ctermbg=235
hi Test9 ctermfg=244 ctermbg=235
" hi StatusLine ctermfg=61 ctermbg=235
" hi StatusLineNC term=reverse cterm=bold ctermfg=8
" Hack to make StatusLineNC a single color
hi link User1 Test1
hi link User2 Test2
hi link User3 Test3
hi link User4 StatusLine
hi link User5 Test5
hi link User6 Test6
hi link User8 Test8
hi link User9 Test9

" A nice, minimalistic tabline
" hi TabLine cterm=bold,underline ctermfg=8 ctermbg=0
" hi TabLineSel term=none cterm=none ctermfg=15 ctermbg=242
" hi TabLineFill cterm=bold ctermbg=0
