command -nargs=1 Warn echohl WarningMsg | echo <args> | echohl None

" Remember last position in file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Helps if you have to use another editor on the same file
autocmd FileChangedShell * Warn "File has been changed outside of vim."

" Makes the current buffer a scratch buffer
function! Scratch()
    set buftype=nofile
    set bufhidden=delete
    set noswapfile
endfunction

" Outputs a small warning when opening a file that contains tab characters
function! WarnTabs()
    if searchpos('\t') != [0,0]
        Warn "Warning, this file contains tabs."
    endif
endfunction
autocmd BufReadPost * call WarnTabs()

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Not sure why the cron filetype isn't catching this...
au FileType crontab set backupcopy=yes

" Enables :make to compile, or validate, certain filetypes
" (use :cn & :cp to jump between errors)
au FileType xml,xslt compiler xmllint
au FileType html compiler tidy
au FileType java compiler javac

" For standards-compliant :TOhtml output
let g:html_use_xhtml=1

set diffopt=filler,iwhite,vertical
