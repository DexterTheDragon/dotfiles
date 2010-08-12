" Not sure why the cron filetype isn't catching this...
au FileType crontab set backupcopy=yes

" Enables :make to compile, or validate, certain filetypes
" (use :cn & :cp to jump between errors)
au FileType xml,xslt compiler xmllint
au FileType html compiler tidy
au FileType java compiler javac

" For standards-compliant :TOhtml output
let html_use_css=1
let use_xhtml=1

set diffopt=filler,iwhite,vertical
let g:rails_statusline=0
