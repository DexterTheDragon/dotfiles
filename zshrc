#!/bin/zsh
# Author: Seth House <seth@eseth.com>
# Modified: 2009-10-11
# thanks to Adam Spiers, Steve Talley, Aaron Toponce, and Unix Power Tools


# {{{ setting options

setopt                          \
        auto_cd                 \
        auto_pushd              \
        chase_links             \
        noclobber               \
        complete_aliases        \
        extended_glob           \
        hist_ignore_all_dups    \
        hist_ignore_space       \
        share_history           \
        no_flow_control         \
        list_types              \
        mark_dirs               \
        path_dirs               \
        prompt_percent          \
        prompt_subst            \
        rm_star_wait            \
        correct

        # ignore_eof              \

# Push a command onto a stack allowing you to run another command first
bindkey '^J' push-line

# }}}
# {{{ source files
if [ -f ~/.shell_environment ]; then
    . ~/.shell_environment
fi

if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi

if [ -f ~/.shell_functions ]; then
    . ~/.shell_functions
fi

if [ -f ~/.dir_colors ]; then
    eval `dircolors ~/.dir_colors`
fi
# }}}
# {{{ completions

autoload -U compinit
compinit -C
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle -e ':completion:*:(ssh|sssh|scp|sshfs|ping|telnet|ftp|rsync):*' hosts 'reply=(${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**})'
zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

source ~/.rake_completion.zsh
source ~/.zsh_functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.pip_completion.zsh
# source ~/.rvm/scripts/zsh/Completion/_rvm

# }}}
# {{{ prompt and theme

# Set vi-mode and create a few additional Vim-like mappings
bindkey -v
bindkey "^?" backward-delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\e[3~' delete-char
# bindkey -M vicmd "^R" redo
# bindkey -M vicmd "u" undo
# bindkey -M vicmd "ga" what-cursor-position
# bindkey -M viins '^p' history-beginning-search-backward
# bindkey -M vicmd '^p' history-beginning-search-backward
# bindkey -M viins '^n' history-beginning-search-forward
# bindkey -M vicmd '^n' history-beginning-search-forward

# Allows editing the command line with an external editor
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# autoload -U promptinit
# promptinit
# prompt adam2 grey green magenta white
if [[ ! -n "$ZSHRUN" ]]; then
    # FIXME: there must be a better way
    if [ -f $HOME/.zsh_prompt ]; then
        source $HOME/.zsh_prompt
    fi
fi

# }}}
# {{{ aliases

# autoload -U zmv
# alias zmv='noglob zmv'
# e.g., zmv *.JPEG *.jpg

# Integrate ssh-agent with GNU Screen:
######################################
#
# ssh-agent varies the location of the socket pointed to by SSH_AUTH_SOCK; to
# avoid having to update that variable in every terminal running in Screen
# every time we reattach we create a permanent pointer that is easier to update
# SCREEN_AUTH_SOCK=$HOME/.screen/ssh-auth-sock
#
# For local Screen sessions, start ssh-agent and update SCREEN_AUTH_SOCK to
# point to the new ssh-agent socket. Bonus: when the screen session is detached
# the agent will be killed, securing your session. Simply run ssh-add every
# time you start a new screen session or reattach.
# alias sc="exec ssh-agent \
    # sh -c 'ln -sfn \$SSH_AUTH_SOCK $SCREEN_AUTH_SOCK; \
    # SSH_AUTH_SOCK=$SCREEN_AUTH_SOCK exec screen -e\"^Aa\" -S main -DRR'"
#
# For remote Screen sessions (e.g. ssh-ed Screen inside local Screen), update
# SCREEN_AUTH_SOCK to point at the (hopefully) existing forwarded SSH_AUTH_SOCK
# that points to your locally running agent. (For more info see ForwardAgent in
# the ssh_config manpage.)
# alias rsc="exec sh -c 'ln -sfn \$SSH_AUTH_SOCK $SCREEN_AUTH_SOCK; \
    # SSH_AUTH_SOCK=$SCREEN_AUTH_SOCK exec screen -e\"^Ss\" -S main -DRR'"

# tmux agent alias
# alias tm="exec ssh-agent \
    # sh -c 'ln -sfn \$SSH_AUTH_SOCK $SCREEN_AUTH_SOCK; \
    # SSH_AUTH_SOCK=$SCREEN_AUTH_SOCK exec tmux attach'"

# tmux agent alias
# alias rtm="sh -c 'ln -sfn \$SSH_AUTH_SOCK $SCREEN_AUTH_SOCK; \
    # SSH_AUTH_SOCK=$SCREEN_AUTH_SOCK exec tmux attach'"

# Start ssh session in a new Screen window
# sssh() { screen -t $@ ssh "$@"; }

# }}}
# Miscellaneous Functions:
# zshrun A lightweight, one-off application launcher {{{1
# by Mikael Magnusson (I think)
#
# To run a command without closing the dialog press ctrl-j instead of enter
# Invoke like:
# sh -c 'ZSHRUN=1 uxterm -geometry 100x4+0+0 +ls'

if [[ -n "$ZSHRUN" ]]; then
    unset ZSHRUN
    function _accept_and_quit() {
        zsh -c "${BUFFER}" &|
        exit
    }
    zle -N _accept_and_quit
    bindkey "^M" _accept_and_quit
    PROMPT="zshrun %~> "
    RPROMPT=""
fi

# }}}
# EOF
# rvm installer added line:
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -s /usr/local/bin/virtualenvwrapper.sh ] ; then source /usr/local/bin/virtualenvwrapper.sh ; fi
fpath=(~/.rvm/scripts/zsh/Completion/ $fpath)
fpath=(~/.zsh/Completion $fpath)
