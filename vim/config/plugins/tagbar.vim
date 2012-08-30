nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autoshowtag = 1
let g:tagbar_compact = 1
let g:tagbar_width = 30

" Auto-open tagbar only if not in diff mode and the term wide enough to also
" fit an 80-column window (plus eight for line numbers and the fold column).
if &columns > 118
    if ! &diff
        autocmd VimEnter * nested :call tagbar#autoopen(1)
        autocmd FileType * nested :call tagbar#autoopen(0)
    endif
else
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
endif
