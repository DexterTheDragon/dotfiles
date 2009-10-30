alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -lA'
alias l='ls -CF'

alias vim='vim -p'
alias vi='vim'

alias wget='wget -c'

alias less='less -imJMW'
alias locate='locate -i'
alias lynx='lynx -cfg=$HOME/.lynx.cfg -lss=$HOME/.lynx.lss'
alias ducks='du -cks * | sort -rn | head -15'
alias tree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias ps='ps -opid,uid,cpu,time,stat,command'
alias df='df -h'
alias dus='du -sh'
alias cal='cal -3'
alias info='info --vi-keys'

alias cake_clear_cache='find tmp/ -type f -delete'
alias cake_init_tmp='mkdir -p tmp/{logs,cache/{views,models,persistent}}; chmod -R a+w tmp/'
alias svnvimdiff='svn diff --diff-cmd svnvimdiff'

alias ink='sudo ink -p usb'
alias c++_strict='c++ -ansi -pedantic -Wall'
alias rmpyc='find . -name "*.pyc" -delete'
