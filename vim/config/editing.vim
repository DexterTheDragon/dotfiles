set undofile
set undodir=~/.vim/undodir
set showmatch                   " Flashes matching brackets or parentheses
set nobackup                    " Does not write a persistent backup file of an edited file
set writebackup                 " Does keep a backup file while editing a file
set confirm                     " Y-N-C prompt if closing with unsaved changes
set path=.,**                   " Searches the current directory as well as subdirectories with commands like :find, :grep, etc.

set cindent                     " Enables the second-most configurable indentation (see :help C-indenting).
set cinoptions=l1,c4,(s,U1,w1,m1,j1,J1
set cinwords=if,elif,else,for,while,try,except,finally,def,class

set backspace=indent,eol,start  " Allows you to backspace over the listed character types
set expandtab                   " Uses spaces instead of tab characters
set smarttab                    " Helps with backspacing because of expandtab
set softtabstop=4               " Number of spaces that a tab counts for
set shiftwidth=4                " Number of spaces to use for autoindent
set shiftround                  " Rounds indent to a multiple of shiftwidth
set virtualedit=block           " Let cursor move past the last char in <C-V> mode

set nostartofline               " Avoid moving cursor to BOL when jumping around
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)
set pastetoggle=<F5>            " Useful so auto-indenting doesn't mess up code when pasting
" }}}
" Multi-buffer/window/tab editing {{{

set switchbuf=usetab            " Jumps to first window or tab that contains specified buffer instead of duplicating an open window
set hidden                      " Allows opening a new buffer in place of an existing one without first saving the existing one

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" When restoring a hidden buffer Vim doesn't always keep the same view (like
" when your view shows beyond the end of the file). (Vim tip 1375)
if v:version >= 700
    au BufLeave * let b:winview = winsaveview()
    au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
