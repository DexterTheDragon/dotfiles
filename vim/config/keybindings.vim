" specified elsewhere for now
" map <leader>/ ,c<space> " nerdcommenter
" nnoremap <silent> <F2> :YRShow<CR>
" map <F3> :TlistToggle<cr>
" map <F4> :NERDTreeToggle<cr>
" php
" <leader>p PhpDoc string
" vaP/viP PhpBlockSelect
" <F9> rebuild ctags

" Fix for legacy vi inconsistency
map Y y$

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

nnoremap ' `
nnoremap ` '

" FUNCTION KEYS {{{
" Type <F1> follwed by a buffer number or name fragment to jump to it.
" Also replaces the annoying help button. Based on tip 821.

" <F2> YankRing
" <F3> TlistToggle
" <F4> NERDTreeToggle
" <F5> pastetoggle

" Toggle hidden characters display
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>

" toggle line numbers and fold column w00t!
map <silent> <F7> :if &number <Bar>
    \set nonumber <Bar>
    \set foldcolumn=0 <Bar>
        \else <Bar>
    \set number <Bar>
    \set foldcolumn=4 <Bar>
        \endif<cr>

" Toggle spell-checking
map <silent> <F8> :set nospell!<CR>:set nospell?<CR>
" <F9> rebuild ctags

" }}}

" LEADER MAPS {{{
" map <leader>/ ,c<space> " nerdcommenter
" <leader>p PhpDoc string
nmap <silent> <leader>h :silent noh<CR>

" Centers, left, or right-justifies text
noremap <silent> ,c :ce <CR> << <CR>
noremap <silent> ,l :le <CR>
noremap <silent> ,r :ri <CR>

" Toggle line wrapping in normal mode:
nmap <silent> <leader>w :set nowrap!<CR>:set nowrap?<CR>

map <leader>e :py EvaluateCurrentRange()

map <leader>b :ls<CR>:b<Space>

noremap <Leader>a :Ack <cword><CR>
" }}}

" SVN Diffs
" Small, fast, windowed svn diff
noremap <silent> ,sq :new +:read\ !svn\ diff\ #<CR>:exe Scratch()<CR>:set filetype=diff<CR>:set nofoldenable<CR>
" Big, slow, fancy, tabbed vimdiff. When you're done just :tabclose the tab.
noremap <silent> ,sd :tabnew %<CR> :vnew +:read\ !svn\ cat\ #<CR>:exe Scratch()<CR>:diffthis<CR><C-W>w :diffthis<CR>:set syntax=off<CR>

" Open a man-page in a new window
runtime ftplugin/man.vim
nmap K :Man <C-R>=expand("<cword>")<CR><CR>

" Vim Help docs: hit enter to activate links, and backspace as a back button
au FileType help nmap <buffer> <Return> <C-]>
au FileType help nmap <buffer> <BS> <C-o>



map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

" ctrl-h,j,k,l will move between split windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

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

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif
