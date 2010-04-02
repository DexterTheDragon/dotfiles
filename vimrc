" Author: Seth House <seth@eseth.com>
" Version: $LastChangedRevision: 201 $  (Last non-version-controlled release: 1.1.2)
" Modified: $LastChangedDate: 2008-04-27 18:33:16 -0600 (Sun, 27 Apr 2008) $
" Revamped for Vim 7 - will output a few non-critical errors for old versions.
" For more information type :help followed by the command.

set nocompatible                "cp:    turns off strct vi compatibility

" Multi-buffer/window/tab editing {{{

set switchbuf=useopen           "swb:   Jumps to first window or tab that contains specified buffer instead of duplicating an open window
set showtabline=1               "stal:  Display the tabbar if there are multiple tabs. Use :tab ball or invoke Vim with -p
" set hidden                      "hid:   allows opening a new buffer in place of an existing one without first saving the existing one

set splitright                  "spr:   puts new vsplit windows to the right of the current
set splitbelow                  "sb:    puts new split windows to the bottom of the current

set winminheight=0              "wmh:   the minimal line height of any non-current window
set winminwidth=0               "wmw:   the minimal column width of any non-current window

" Type <F1> follwed by a buffer number or name fragment to jump to it.
" Also replaces the annoying help button. Based on tip 821.
map <F1> :ls<CR>:b<Space>

" Earlier Vims did not support tabs. Below is a vertical-tab-like cludge. Use
" :ball or invoke Vim with -o (Vim tip 173)
if version < 700
    " ctrl-j,k will move up or down between split windows and maximize the
    " current window
    nmap <C-J> <C-W>j<C-W>_
    nmap <C-K> <C-W>k<C-W>_
else
    " same thing without the maximization to easily move between split windows
    nmap <C-J> <C-W>j
    nmap <C-K> <C-W>k
    nmap <C-H> <C-W>h
    nmap <C-L> <C-W>l
endif

" When restoring a hidden buffer Vim doesn't always keep the same view (like
" when your view shows beyond the end of the file). (Vim tip 1375)
if v:version >= 700
    au BufLeave * let b:winview = winsaveview()
    au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" }}}

" YankList {{{1
" NOTE: work in progress

noremap <silent> gy :set opfunc=YankList<CR>g@
vmap <silent> gy :<C-U>call YankList(visualmode(), 1)<CR>
map <silent> gyy Y

function! YankList(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    echo "Something was copied!\n"

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line' " Line
        silent exe "normal! '[V']y"
    elseif a:type == 'block' " Block
        silent exe "normal! `[\<C-V>`]y"
    else " ???
        silent exe "normal! `[v`]y"
    endif
endfunction

" }}}
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

" Auto-set certain options as well as syntax highlighting and indentation
filetype plugin indent on

" Not sure why the cron filetype isn't catching this...
au FileType crontab set backupcopy=yes

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

au! BufNewFile,BufRead *.thtml setfiletype php
au! BufNewFile,BufRead *.ctp setfiletype php

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

" Vim Help docs: hit enter to activate links, and ctrl-[ as a back button
"au FileType help nmap <buffer> <Return> <C-]>
"au FileType help nmap <buffer> <C-[> <C-O>




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


" Open a man-page in a new window
runtime ftplugin/man.vim
nmap K :Man <C-R>=expand("<cword>")<CR><CR>

" }}}



runtime! config/**/*



let php_folding=1
let g:rails_statusline=0



autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit





" eof
" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=4:shiftwidth=4:softtabstop=4:smarttab:shiftround:expandtab
