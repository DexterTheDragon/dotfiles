"
" General things that should be done at the very end, to override plugin
" settings
"

" Function to do <Tab> or completion, based on context {{{
function MyTabOrCompletion()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction
" }}}

"
" Map CTRL-B to snippetsEmu and use <Tab> for our smart completion
if exists('loaded_snippet')
    imap <C-B> <Plug>Jumper
endif
inoremap <Tab> <C-R>=MyTabOrCompletion()<CR>

" Set CVS executable for VCSCommand plugin
if exists('loaded_VCSCommand')
    let VCSCommandCVSExec="cvs"
endif

" vim: set fdm=marker:
