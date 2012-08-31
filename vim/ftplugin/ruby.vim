setlocal shiftwidth=2
setlocal tabstop=2

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
