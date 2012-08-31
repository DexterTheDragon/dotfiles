" use omnicomplete when possible
let g:SuperTabDefaultCompletionType='context'
" needed because rails.vim sets the completefunc which supertab tries to use
" before omni
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
