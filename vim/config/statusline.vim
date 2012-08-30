" TODO: add a check for screen width and remove the alternate buffer display
" and args of total display for small screen widths.
function! MyStatusLine()
    let s = '%9* %4* ' " pad the edges for better vsplit seperation
    let s .= '%3*' " User highlighting
    let s .= '%%%n ' " Buffer number
    if bufname('') != '' " why is this such a pain in the ass? FIXME: there's a bug in here somewhere. Test with a split with buftype=nofile
        let s .= "%{ pathshorten(fnamemodify(expand('%F'), ':~:.')) }" " short-hand path of of the current buffer (use :ls to see more info)
    else
        let s .= '%f' " an empty filename doesn't make it through the above filters
    endif
    let s .= '%4*' " restore normal highlighting
    let s .= '%2*' " User highlighting
    let s .= '%m' " modified
    let s .= '%r' " read-only
    let s .= '%w' " preview window
    let s .= '%4*' " restore normal highlighting
    let s .= ' %<' " start truncating from here if the window gets too small
    " FIXME: this doens't work well with multiple windows...
    if bufname('#') != '' " if there's an alternate buffer, display the name
        let s .= '%4*' " user highlighting
        let s .= '(#' . bufnr('#') . ' '
        let s .= fnamemodify(bufname('#'), ':t')
        let s .= ')'
        let s .= '%4* ' " restore normal highlighting
    endif
    let s .= '%5*' " User highlighting
    let s .= '%y' " file-type
    let s .= '%4*' " restore normal highlighting
    let s .= ' <'
    let s .= '%8*' " User highlighting
    let s .= '%{&fileencoding}' " fileencoding NOTE: this doesn't always display, needs more testing
    let s .= '%4*,' " restore normal highlighting
    let s .= '%6*' " User highlighting
    let s .= '%{&fileformat}' " line-ending type
    let s .= '%4*' " restore normal highlighting
    let s .= '>'
    let s .= '%a' " (args of total)
    let s .= '  %9*' " user highlighting
    let s .= '%=' " seperate right- from left-aligned
    let s .= '%4*' " restore normal highlighting
    let s .= '%1*' " User highlighting
    let s .= '%l' " current line number
    let s .= '%4*' " restore normal highlighting
    let s .= ',%c' " column number
    let s .= '%V' " virtual column number (doesn't count indentation)
    let s .= ' %1*' " User highlighting
    let s .= 'of %L' " total line numbers
    let s .= '%4* ' " restore normal highlighting
    let s .= '%3*' " user highlighting
    let s .= '%P' " Percentage through file
    let s .= '%4*' " restore normal highlighting
    let s .= ' %9* %4*' " pad the edges for better vsplit seperation
    return s
endfunction
set statusline=%!MyStatusLine()
