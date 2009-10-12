augroup filetypedetect
    au! BufRead,BufNewFile *.thtml  setfiletype php
    au! BufRead,BufNewFile *.ctp    setfiletype php
    au! BufRead,BufNewFile *.html    setfiletype htmldjango
    au! BufNewFile,BufRead *.txt setfiletype text
augroup END
