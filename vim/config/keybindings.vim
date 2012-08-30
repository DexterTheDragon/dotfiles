let mapleader = ","

" no ex mode
map Q <Nop>

" Fix for legacy vi inconsistency
map Y y$

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Reverse mark jump commands (so ' will jump to exact position)
nnoremap ' `
nnoremap ` '

" FUNCTION KEYS {{{
" <F2> GundoToggle
" <F3> NERDTreeToggle
" <F4> TagbarToggle
" <F5> pastetoggle
" Toggle hidden characters display
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>
" Toggle spell-checking
map <silent> <F7> :set nospell!<CR>:set nospell?<CR>
" Toggle foldcolumn, numbers, list, spell, etc
map <silent> <F8> :call CleanScreen()<CR>
" }}}

" Toggle line wrapping in normal mode:
nmap <silent> <leader>w :set nowrap!<CR>:set nowrap?<CR>

" List buffers and select one
map <leader>b :ls<CR>:b<Space>

" Find merge conflict markers
map <leader>fc /\v^[<=>]{7}( .*\|$)<cr>

" Add a line without changing position or leaving mode
map <leader>o :set paste<cr>m`o<esc>'`:set nopaste<cr>
map <leader>O :set paste<cr>m`O<esc>'`:set nopaste<cr>

" Change directory to the path of the current file
map <leader>cd :cd %:p:h<cr>
" Edit a new file starting in the same dir as the current file
map <leader>ce :e <C-R>=expand("%:p:h") . "/" <cr>
map <leader>cs :sp <C-R>=expand("%:p:h") . "/" <cr>
map <leader>ct :tabnew <C-R>=expand("%:p:h") . "/" <cr>

noremap <Leader>a :Ack! <cword><CR>

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>n :exe "set " . (&relativenumber == 1 ? "" : "relative") . "number"<cr>

" Maps Omnicompletion to CTRL-space since ctrl-x ctrl-o is for Emacs-style RSI
inoremap <nul> <C-X><C-O>

noremap !s :!rspec % -l <C-r>=line('.')<CR><CR>
noremap !S :!rspec % <CR>

" Open a man-page in a new window
runtime ftplugin/man.vim
" nmap K :Man <C-R>=expand("<cword>")<CR><CR>

" ctrl-h,j,k,l will move between split windows
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" indenting
vnoremap < <gv
vnoremap > >gv
map <Tab> >>
map <S-Tab> <<
vmap <Tab> >
vmap <S-Tab> <

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif
