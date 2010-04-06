
set nocompatible                "cp:    turns off strct vi compatibility
filetype plugin indent on

" MyTabLine {{{
" This is an attempt to emulate the default Vim-7 tabs as closely as possible but with numbered tabs.

" TODO: set truncation when tabs don't fit on line, see :h columns
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        for i in range(tabpagenr('$'))
            " set up some oft-used variables
            let tab = i + 1 " range() starts at 0
            let winnr = tabpagewinnr(tab) " gets current window of current tab
            let buflist = tabpagebuflist(tab) " list of buffers associated with the windows in the current tab
            let bufnr = buflist[winnr - 1] " current buffer number
            let bufname = bufname(bufnr) " gets the name of the current buffer in the current window of the current tab

            let s .= '%' . tab . 'T' " start a tab
            let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#') " if this tab is the current tab...set the right highlighting
            let s .= ' #' . tab " current tab number
            let n = tabpagewinnr(tab,'$') " get the number of windows in the current tab
            if n > 1
                let s .= ':' . n " if there's more than one, add a colon and display the count
            endif
			let bufmodified = getbufvar(bufnr, "&mod")
            if bufmodified
                let s .= ' +'
            endif
            if bufname != ''
                let s .= ' ' . pathshorten(bufname) . ' ' " outputs the one-letter-path shorthand & filename
            else
                let s .= ' [No Name] '
            endif
        endfor
        let s .= '%#TabLineFill#' " blank highlighting between the tabs and the righthand close 'X'
        let s .= '%T' " resets tab page number?
        let s .= '%=' " seperate left-aligned from right-aligned
        let s .= '%#TabLine#' " set highlight for the 'X' below
        let s .= '%999XX' " places an 'X' at the far-right
        return s
    endfunction
    " set tabline=%!MyTabLine()
endif

" }}}
" Autocommands, plugin, and file-type-specific settings {{{

" Remember last position in file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Not sure why the cron filetype isn't catching this...
au FileType crontab set backupcopy=yes

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Enables :make to compile, or validate, certain filetypes
" (use :cn & :cp to jump between errors)
au FileType xml,xslt compiler xmllint
au FileType html compiler tidy
au FileType java compiler javac

" For standards-compliant :TOhtml output
let html_use_css=1
let use_xhtml=1

" Helps if you have to use another editor on the same file
autocmd FileChangedShell *
    \ echohl WarningMsg |
    \ echo "File has been changed outside of vim." |
    \ echohl None


" Makes the current buffer a scratch buffer
function! Scratch()
    set buftype=nofile
    set bufhidden=delete
    set noswapfile
endfunction

" Outputs a small warning when opening a file that contains tab characters
function! WarnTabs()
    if searchpos('\t') != [0,0]
        echohl WarningMsg |
        \ echo "Warning, this file contains tabs." |
        \ echohl None
    endif
endfunction
autocmd BufReadPost * call WarnTabs()

" }}}

" load everything else in its own config file
runtime! config/**/*

let g:rails_statusline=0

" eof
" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=4:shiftwidth=4:softtabstop=4:smarttab:shiftround:expandtab
