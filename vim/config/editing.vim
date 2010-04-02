" Line Wrap {{{

set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
set nowrap                        "wrap:  wraps lines by default

" }}}
" Editing {{{

set showmatch                   "sm:    flashes matching brackets or parentheses
set matchtime=3

set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file

set confirm                     " Y-N-C prompt if closing with unsaved changes

" Searches the current directory as well as subdirectories with commands like :find, :grep, etc.
set path=.,**

set cindent                     "cin:   enables the second-most configurable indentation (see :help C-indenting).
set cinoptions=l1,c4,(s,U1,w1,m1,j1
set cinwords=if,elif,else,for,while,try,except,finally,def,class

set expandtab                   "et:    uses spaces instead of tab characters
set smarttab                    "sta:   helps with backspacing because of expandtab
set tabstop=4                   "ts:    number of spaces that a tab counts for
set shiftwidth=4                "sw:    number of spaces to use for autoindent
set shiftround                  "sr:    rounds indent to a multiple of shiftwidth

set nojoinspaces                "nojs:  prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set pastetoggle=<F5>            "pt:    useful so auto-indenting doesn't mess up code when pasting


"lcs:   displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>

" Unobtrusive highlighting of trailing whitespace
" highlight ExtraWhitespace ctermbg=darkgreen guibg=red
" au ColorScheme * highlight ExtraWhitespace guibg=red
" au BufEnter * match ExtraWhitespace /\s\+$/
" au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" au InsertLeave * match ExtraWhiteSpace /\s\+$/

" this is better than the highlighting
" set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " stupid triangle with this font
set listchars=tab:>-,trail:⋅,nbsp:⋅
au BufEnter * set list
au InsertEnter * set nolist
au InsertLeave * set list


" }}}
