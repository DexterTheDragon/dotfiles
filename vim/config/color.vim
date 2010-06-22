" Color {{{
syntax on                       "syn:   syntax highlighting
"   All coloring options are for the non-GUI Vim (see :help cterm-colors).

" set t_Co=16
color xoria256

" The default fold color is too bright and looks too much like the statusline
" hi Folded cterm=bold ctermfg=9 ctermbg=0
" hi FoldColumn cterm=bold ctermfg=9 ctermbg=0

" I love the new CursorLine, but terminal underlining kicks legibility in the nuts.
" So what to do? Bold is (extremely) subtle, but it's better than nothing.
" hi CursorLine cterm=bold

" Statusline
" I like this better than all the reverse video of the default statusline.
" hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=0
" hi StatusLineNC term=reverse cterm=bold ctermfg=8
" hi User1 ctermfg=4
" hi User2 ctermfg=1
" hi User3 ctermfg=5
" hi User4 cterm=bold ctermfg=8
" hi User5 ctermfg=6
" hi User6 ctermfg=2
" hi User7 ctermfg=2
" hi User8 ctermfg=3
" hi User9 cterm=reverse ctermfg=8 ctermbg=7

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
hi CursorLine cterm=bold

" Statusline
" I like this better than all the reverse video of the default statusline.
hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=0
hi StatusLineNC term=reverse cterm=bold ctermfg=8
hi User1 ctermfg=4
hi User2 ctermfg=1
hi User3 ctermfg=5
hi User4 cterm=bold ctermfg=8
hi User5 ctermfg=6
hi User6 ctermfg=2
hi User7 ctermfg=2
hi User8 ctermfg=3
hi User9 cterm=reverse ctermfg=8 ctermbg=7

" A nice, minimalistic tabline
hi TabLine cterm=bold,underline ctermfg=8 ctermbg=0
hi TabLineSel term=none cterm=none ctermfg=15 ctermbg=242
hi TabLineFill cterm=bold ctermbg=0

" }}}
