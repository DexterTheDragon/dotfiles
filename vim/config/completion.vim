set wildmenu                    "wmnu:  enhanced ex command completion
set wildmode=longest:full,list:full  "wim:   helps wildmenu auto-completion
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp

set completeopt=menu,menuone,longest,preview
set complete=.,w,b,u,i          " Use default insert completion minus tags (tags have own completion and are often slow)
