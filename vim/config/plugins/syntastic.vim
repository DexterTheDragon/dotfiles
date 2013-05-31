" use signs to indicate lines with errors
" only if signs are available
if has('signs')
   let g:syntastic_enable_signs = 1
endif

" automatically open the location list when a buffer has errors
let g:syntastic_auto_loc_list=1

" always show warnings
let g:syntastic_quiet_warnings=0
" let g:syntastic_check_on_open=1
map <leader>l :SyntasticCheck<CR>

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
