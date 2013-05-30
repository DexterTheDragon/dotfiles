let g:vroom_use_vimux=1
let g:vroom_use_bundle_exec=0
let g:vroom_spec_command='COVERAGE=false rspec --no-profile'
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"
let g:VimuxResetSequence = "q C-u C-l"
nmap <Leader>vu :VimuxScrollUpInspect<CR>
nmap <Leader>vd :VimuxScrollDownInspect<CR>
nmap <Leader>vc :VimuxCloseRunner<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
