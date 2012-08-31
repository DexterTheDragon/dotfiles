" syntax settings
let python_highlight_all=1
let python_slow_sync=1
let python_print_as_function=1

setlocal foldmethod=expr

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

autocmd FileType python set omnifunc=pythoncomplete#Complete

python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <leader>e :py EvaluateCurrentRange()
