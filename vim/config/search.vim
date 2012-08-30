set hlsearch                    "hls:   highlights search results
set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters

" Use leader-h to unhighlight search results in normal mode:
nmap <silent> <leader>h :silent noh<CR>
" Display the number of matches for the last search
nmap <leader># :%s:<C-R>/::gn<cr>
" Restore case-sensitivity for jumping to tags (set ic disables it)
map <silent> <C-]> :set noic<cr>g<C-]><silent>:set ic<cr>
