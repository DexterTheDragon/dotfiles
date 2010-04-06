" Window Layout {{{

set tabpagemax=30
set number                      "nu:    numbers lines
set numberwidth=1               " Use 1 col + 1 space for numbers
set showmode                    "smd:   shows current vi mode in lower left
set cursorline                  "cul:   highlights the current line
set showcmd                     "sc:    shows typed commands
set title                       " show file in titlebar
set cmdheight=2                 "ch:    make a little more room for error messages
set sidescroll=2                "ss:    only scroll horizontally little by little
set scrolloff=5                 "so:    places a line between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple columns between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
set viminfo='100,f1,:100,/100   "vi:    For a nice, huuuuuge viminfo file

if &columns == 80
    " If we're on an 80-char wide term, don't display these screen hogs
    set nonumber
    set foldcolumn=0
endif

" }}}
" Folding (spacebar toggles) {{{
" Spacebar toggles a fold, zi toggles all folding, zM closes all folds

noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

set foldmethod=marker           "fdm:   looks for patterns of triple-braces in a file
set foldcolumn=4                "fdc:   creates a small left-hand gutter for displaying fold info

" }}}
" MyStatusLine {{{

" TODO: add a check for screen width and remove the alternate buffer display
" and args of total display for small screen widths.
function! MyStatusLine()
    let s = '%9* %* ' " pad the edges for better vsplit seperation
    let s .= '%3*' " User highlighting
    let s .= '%%%n ' " Buffer number
    if bufname('') != '' " why is this such a pain in the ass? FIXME: there's a bug in here somewhere. Test with a split with buftype=nofile
        let s .= "%{ pathshorten(fnamemodify(expand('%F'), ':~:.')) }" " short-hand path of of the current buffer (use :ls to see more info)
    else
        let s .= '%f' " an empty filename doesn't make it through the above filters
    endif
    let s .= '%*' " restore normal highlighting
    let s .= '%2*' " User highlighting
    let s .= '%m' " modified
    let s .= '%r' " read-only
    let s .= '%w' " preview window
    let s .= '%*' " restore normal highlighting
    let s .= ' %<' " start truncating from here if the window gets too small
    " FIXME: this doens't work well with multiple windows...
    if bufname('#') != '' " if there's an alternate buffer, display the name
        let s .= '%4*' " user highlighting
        let s .= '(#' . bufnr('#') . ' '
        let s .= fnamemodify(bufname('#'), ':t')
        let s .= ')'
        let s .= '%* ' " restore normal highlighting
    endif
    let s .= '%5*' " User highlighting
    let s .= '%y' " file-type
    let s .= '%*' " restore normal highlighting
    let s .= ' <'
    let s .= '%8*' " User highlighting
    let s .= '%{&fileencoding}' " fileencoding NOTE: this doesn't always display, needs more testing
    let s .= '%*,' " restore normal highlighting
    let s .= '%6*' " User highlighting
    let s .= '%{&fileformat}' " line-ending type
    let s .= '%*' " restore normal highlighting
    let s .= '>'
    let s .= '%a' " (args of total)
    let s .= '  %9*' " user highlighting
    let s .= '%=' " seperate right- from left-aligned
    let s .= '%*' " restore normal highlighting
    let s .= '%1*' " User highlighting
    let s .= '%l' " current line number
    let s .= '%*' " restore normal highlighting
    let s .= ',%c' " column number
    let s .= '%V' " virtual column number (doesn't count indentation)
    let s .= ' %1*' " User highlighting
    let s .= 'of %L' " total line numbers
    let s .= '%* ' " restore normal highlighting
    let s .= '%3*' " user highlighting
    let s .= '%P' " Percentage through file
    let s .= '%*' " restore normal highlighting
    let s .= ' %9* %*' " pad the edges for better vsplit seperation
    return s
endfunction
set statusline=%!MyStatusLine()

" }}}
" Printing {{{

" Shows line numbers and adjusts the left margin not to be ridiculous
set printoptions=number:y,left:5pc
set printfont=Monaco:h8         " face-type (not size) ignored in PostScript output :-(
set printencoding=utf-8

" }}}
