set encoding=utf-8
" Window Layout {{{
set lazyredraw         " Will not redraw the screen while running macros (goes faster)
set linebreak          " Causes vim to not wrap text in the middle of a word
set nowrap             " Don't wrap lines by default
set tabpagemax=30      " Max number of tabs opened by the -p option
set number             " Print line numbers
set numberwidth=1      " Use 1 col + 1 space for numbers
set showmode           " Shows current vi mode in lower left
set cursorline         " Highlights the current line
set showcmd            " Shows typed commands
set cmdheight=2        " Make a little more room for error messages
set sidescroll=2       " Only scroll horizontally little by little
set scrolloff=5        " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=2    " Places a couple columns between the current column and the screen edge
set laststatus=2       " Makes the status bar always visible
set ttyfast            " Improves redrawing for newer computers
set colorcolumn=80,120 " Draw a line down the screen
set history=100        " Save the last 100 commands/search terms
set viminfo='100,f1,h  " For a nice, huuuuuge viminfo file
                            " '100 : marks will be remembered for up to 100 previously edited files
                            " f1   : store file marks (0-9 A-Z)
                            " h    : disable hlsearch when opening file
set showtabline=1      " Display the tabbar if there are multiple tabs

if &columns == 80
    " If we're on an 80-char wide term, don't display these screen hogs
    set nonumber
    set foldcolumn=0
endif

" Displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
" set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " stupid triangle with this font
set listchars=tab:>-,trail:⋅,nbsp:⋅
set list
" au BufEnter * set list
" au InsertEnter * set nolist
" au InsertLeave * set list
" }}}
" Folding (spacebar toggles) {{{

" Spacebar toggles a fold, zi toggles all folding, zM closes all folds
noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

set foldmethod=marker           "fdm:   looks for patterns of triple-braces in a file
set foldcolumn=3                "fdc:   creates a small left-hand gutter for displaying fold info

" }}}
" Printing {{{

" Shows line numbers and adjusts the left margin not to be ridiculous
set printoptions=number:y,left:5pc
set printfont=Monaco:h8         " face-type (not size) ignored in PostScript output :-(
set printencoding=utf-8

" }}}
