" toggle line numbers and fold column w00t!
function CleanScreen()
    if &number
        set nonumber
        set foldcolumn=0
        set nolist
        set nospell
        :NERDTreeClose
        :TagbarClose
        if g:showmarks_enable
            :ShowMarksToggle
        endif
    else
        set number
        set foldcolumn=4
        if !g:showmarks_enable
            :ShowMarksToggle
        endif
    endif
endfunction
