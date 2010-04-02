" Fix for legacy vi inconsistency
map Y y$

" A shortcut to show the numbered register contents
map <F2> :reg "0123456789-*+:/<CR>

" Toggle hidden characters display
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>

" Toggle spell-checking
map <silent> <F8> :set nospell!<CR>:set nospell?<CR>

" Toggle line wrapping in normal mode:
nmap <silent> <C-P> :set nowrap!<CR>:set nowrap?<CR>

" SVN Diffs
" Small, fast, windowed svn diff
noremap <silent> ,sq :new +:read\ !svn\ diff\ #<CR>:exe Scratch()<CR>:set filetype=diff<CR>:set nofoldenable<CR>
" Big, slow, fancy, tabbed vimdiff. When you're done just :tabclose the tab.
noremap <silent> ,sd :tabnew %<CR> :vnew +:read\ !svn\ cat\ #<CR>:exe Scratch()<CR>:diffthis<CR><C-W>w :diffthis<CR>:set syntax=off<CR>


" Quit using arrow keys!
"map <Up> :q<CR>
"map <Down> :q<CR>
"map <Left> :q<CR>
"map <Right> :q<CR>
vnoremap < <gv
vnoremap > >gv
map <Tab> >>
map <S-Tab> <<
vmap <Tab> >
vmap <S-Tab> <

" Centers, left, or right-justifies text
noremap <silent> ,c :ce <CR> << <CR>
noremap <silent> ,l :le <CR>
noremap <silent> ,r :ri <CR>


" toggle line numbers and fold column w00t!
map <silent> <F7> :if &number <Bar>
    \set nonumber <Bar>
    \set foldcolumn=0 <Bar>
        \else <Bar>
    \set number <Bar>
    \set foldcolumn=4 <Bar>
        \endif<cr>
